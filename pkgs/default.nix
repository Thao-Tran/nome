# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  spotify-to-tidal = pkgs.callPackage ./spotify-to-tidal.nix { };
  tidalapi_088 = pkgs.callPackage ./tidalapi.nix { };
}
