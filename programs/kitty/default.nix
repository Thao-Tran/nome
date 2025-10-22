{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    font.package = pkgs.fira-code;
    font.name = "FiraCode";
    font.size = 14.0;

    themeFile = "Doom_One";

    settings = {
      tab_bar_style = "separator";
      enabled_layouts = "splits";
    };

    keybindings = {
      "f4" = "launch --cwd=current --location=split";
      "f5" = "launch --cwd=current --location=hsplit";
      "f6" = "launch --cwd=current --location=vsplit";
      "f7" = "layout_action rotate";
      "cmd+t" = "launch --cwd=current --type=tab";
      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";
      "ctrl+shift+alt+t" = "set_tab_title";
    };
  };

  programs.zsh.shellAliases.kssh = "kitten ssh";
}
