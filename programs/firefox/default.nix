{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    # IMPORTANT: Must use a package provided by the firefox overlay (ends with `-bin`)
    # Also need to provide an override to be compatible with 25.05
    package = pkgs.firefox-bin.overrideAttrs (_: rec {
      override = _: pkgs.firefox-bin;
    });
  };
}
