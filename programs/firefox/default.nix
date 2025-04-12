{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    # IMPORTANT: Must use a package provided by the firefox overlay (ends with `-bin`)
    package = pkgs.firefox-bin;
  };
}
