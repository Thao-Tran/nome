{
  description = "Home Manager configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    nixpkgs-firefox-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixpkgs-firefox-darwin,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs-unstable.legacyPackages.${system});

      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = {
        inherit inputs;

        # This one brings our custom packages from the 'pkgs' directory
        additions = final: _prev: import ./pkgs final.pkgs;

        # This one contains whatever you want to overlay
        # You can change versions, add patches, set compilation flags, anything really.
        # https://nixos.wiki/wiki/Overlays
        modifications = final: prev: {
          # example = prev.example.overrideAttrs (oldAttrs: rec {
          # ...
          # });
        };

        # When applied, the unstable nixpkgs set (declared in the flake inputs) will
        # be accessible through 'pkgs.unstable'
        unstable-packages = final: _prev: {
          unstable = import nixpkgs-unstable {
            system = final.system;
            config.allowUnfree = true;
          };
        };

        firefox = nixpkgs-firefox-darwin.overlay;
      };

      homeConfigurations = {
        "ttlp" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-darwin;
          extraSpecialArgs = { inherit inputs outputs; };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./users/ttlp.nix ];
        };
      };
    };
}
