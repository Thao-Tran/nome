{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    font.package = pkgs.fira-code;
    font.name = "FiraCode";

    themeFile = "Doom_One";

    settings = {
      tab_bar_style = "separator";
      enabled_layouts = "splits";
    };

    keybindings = {
      "f4" = "launch --location=split";
      "f5" = "launch --location=hsplit";
      "f6" = "launch --location=vsplit";
      "f7" = "layout_action rotate";
      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";
      "ctrl+shift+alt+t" = "set_tab_title";
    };
  };

  programs.zsh.shellAliases.kssh = "kitten ssh";
}
