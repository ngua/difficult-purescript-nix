{ pkgs, lib, ... }:

let
  shortVersion = x:
    lib.strings.removePrefix "v" (builtins.replaceStrings [ "." ] [ "_" ] x);
  mk = path: version: sha256s:
    let
      name = lib.removeSuffix ".nix" (builtins.baseNameOf path);
    in
    lib.nameValuePair
      "${name}-${shortVersion version}"
      (pkgs.callPackage path { inherit version sha256s; });
  mkNpmFetch = pname: version: sha256:
    lib.nameValuePair
      "${pname}-${shortVersion version}"
      (
        pkgs.callPackage ../pkgs/npm-fetch.nix {
          inherit pname version lib sha256;
        }
      );
in
rec {
  inherit shortVersion mkNpmFetch;
  mkPurs = mk ../pkgs/purs.nix;
  mkSpago = mk ../pkgs/spago.nix;
  foldMergeAttrs = lib.foldl' lib.mergeAttrs { };
}
