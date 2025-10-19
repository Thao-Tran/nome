{
  lib,
  fetchFromGitHub,
  python3Packages
}:
with python3Packages;
buildPythonPackage rec {
  pname = "tidalapi";
  version = "0.8.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "EbbLabs";
    repo = "python-tidal";
    tag = "v${version}";
    hash = "sha256-+O+U8QZhaOdUgPONv1tb5ctiK8NmD2NJK0hokmNtUZM=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    pyaes
    requests
    python-dateutil
    mpegdash
    isodate
    ratelimit
    typing-extensions
  ];

  doCheck = false; # tests require internet access

  pythonImportsCheck = [
    "tidalapi"
  ];

  meta = {
    changelog = "https://github.com/tamland/python-tidal/blob/v${version}/HISTORY.rst";
    description = "Unofficial Python API for TIDAL music streaming service";
    homepage = "https://github.com/tamland/python-tidal";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      drawbu
      ryand56
    ];
  };
}
