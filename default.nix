{
  pkgs ? import <nixpkgs> { },
}:
{
  dbar4gun = pkgs.callPackage ./dbar4gun/ { };
}
