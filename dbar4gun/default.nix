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
#    changelog = "https://github.com/Mord3rca/gamma-launcher/releases/tag/v${version}";
#    homepage = "https://github.com/Mord3rca/gamma-launcher";
#    mainProgram = "gamma-launcher";
#    license = lib.licenses.gpl3Plus;
#    maintainers = with lib.maintainers; [
#      DrymarchonShaun
#      bbigras
#    ];
    platforms = lib.platforms.linux;
  };
}
