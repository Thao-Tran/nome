{
  imports = [
    ./direnv/default.nix
    # Firefox is really finicky so just gonna exclude from home-manager now
    # ./firefox/default.nix
    ./git/default.nix
    ./home-manager/default.nix
    ./kitty/default.nix
    ./neovim/default.nix
    ./ssh/default.nix
    ./starship/default.nix
    ./vim/default.nix
    ./zsh/default.nix
  ];
}
