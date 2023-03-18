{ pkgs, ... }:

let
  inherit (pkgs) lib;
in
rec {
  shortVersion = x:
    lib.strings.removePrefix "v" (builtins.replaceStrings [ "." ] [ "_" ] x);
  mkPurs =
    version: sha256s:
    lib.nameValuePair
      ("purs-${shortVersion version}")
      (pkgs.callPackage ./purs.nix { inherit version sha256s; });
}
