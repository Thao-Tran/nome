{ outputs, pkgs, ... }:
{
  imports = [ ../programs/default.nix ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.firefox

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ttlp";
  home.homeDirectory = "/Users/ttlp";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Development tools
    ## Rust
    cargo
    rustc

    ## JS/TS
    ember-cli
    lerna_6
    nodejs_22
    pnpm
    typescript
    turbo

    # Misc CLI tools
    awscli2
    curl
    docker
    fd
    git-filter-repo
    k9s
    kubectl
    ripgrep
    watchman
    zk

    # Language servers
    bash-language-server
    dockerfile-language-server-nodejs
    ember-language-server
    gopls
    jdt-language-server
    lua-language-server
    marksman
    nginx-language-server
    nixd
    pylyzer
    rust-analyzer
    stylelint-lsp
    svelte-language-server
    tailwindcss-language-server
    terraform-ls
    texlab
    typescript-language-server
    vim-language-server
    vscode-langservers-extracted
    yaml-language-server

    # Apps
    spotify
    gifski

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ttlp/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  programs.git.userName = "Thao-Tran Le-Phuong";
  programs.git.userEmail = "thaotran.lp@gmail.com";

  programs.git.extraConfig.credential = {
    "https://github.com" = {
      username = "Thao-Tran";
    };
  };
}
