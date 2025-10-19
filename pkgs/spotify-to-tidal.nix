{
  lib,
  fetchFromGitHub,
  fetchPypi,
  python3Packages,
  pkgs
}:
with python3Packages;
buildPythonPackage rec {
  pname = "spotify-to-tidal";
  version = "1.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spotify2tidal";
    repo = "spotify_to_tidal";
    tag = "v${version}";
    hash = "sha256-VB8jzvodr+oNMqLTMoH2CTPOmmDLIC8Z4jP2Jk0WLFo=";
  };

  postPatch = ''
  '';

  build-system = [
    setuptools
  #   setuptools-scm
  ];

  dependencies = let
    spotipy = python3Packages.spotipy.overrideAttrs {
      src = fetchPypi {
        pname = "spotipy";
        version = "2.24.0";
        hash = "sha256-OWr4HmQghlUa8VcnDN/nQsFzlAWHG6nawfplG4ZJ7w0=";
      };
    };
  in [
    spotipy
    pkgs.tidalapi_088
    pyaes
    pyyaml
    tqdm
    sqlalchemy
    pytest
    pytest-mock
  ];

  # nativeCheckInputs = [ hypothesis ];

  meta = {
    changelog = "https://github.com/spotify2tidal/spotify_to_tidal/releases/tag/v${version}";
    description = "A command line tool for importing your Spotify playlists into Tidal";
    homepage = "https://github.com/spotify2tidal/spotify_to_tidal";
    license = lib.licenses.agpl3Only;
    #maintainers = with lib.maintainers; [
    #];
  };
}
