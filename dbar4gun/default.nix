{
  lib,
  python313Packages,
  fetchFromGitHub,
  versionCheckHook,
  writableTmpDirAsHomeHook,
  runCommand,
}:

let
in
python313Packages.buildPythonApplication rec {
  pname = "dbar4gun";
  version = "0.18.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lowlevel-1989";
    repo = "dbar4gun";
    tag = "${version}";
    hash = "sha256-82OIzIammz5EuDcsWRzhevfuXQMRRYJ5nsXWTx+Pnis=";
  };

  build-system = [ python313Packages.setuptools ];
  dependencies = with python313Packages; [
    evdev
    pyudev
    pygame
  ];

  #Program does not respond to the '--version' flag and will not work for now

  #nativeCheckInputs = [
  #  versionCheckHook
  #  writableTmpDirAsHomeHook
  #];
  #versionCheckKeepEnvironment = [ "HOME" ];
  #doInstallCheck = true;

  postFixup = ''
    wrapProgram $out/bin/dbar4gun
  '';

  meta = {
    description = "dbar4gun";
    changelog = "https://github.com/lowlevel-1989/dbar4gun/releases/tag/${version}";
    homepage = "https://github.com/lowlevel-1989/dbar4gun";
    mainProgram = "dbar4gun";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      PointDevice
    ];
    platforms = lib.platforms.linux;
  };
}
