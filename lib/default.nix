{ pkgs, ... }:

let
  inherit (pkgs) lib;
  shortVersion = x:
    lib.strings.removePrefix "v" (builtins.replaceStrings [ "." ] [ "_" ] x);
  mk = path: version: sha256s:
    let
      name = lib.removeSuffix ".nix" (builtins.baseNameOf path);
    in
    lib.nameValuePair
      ("${name}-${shortVersion version}")
      (pkgs.callPackage path { inherit version sha256s; });
in
rec {
  inherit shortVersion;
  mkPurs = mk ../pkgs/purs.nix;
  mkSpago = mk ../pkgs/spago.nix;
}
