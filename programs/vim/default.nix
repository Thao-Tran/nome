{ lib, pkgs, ... }:
{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [ onedark-vim ];

    extraConfig = ''
      ${lib.fileContents ./init.vim}

      colorscheme onedark
    '';
  };
}
