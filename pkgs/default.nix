{ pkgs, lib, ... }:

let
  plib = import ../lib { inherit pkgs lib; };
  versions = import ./versions.nix { inherit pkgs lib plib; };
in
versions // rec {
  inherit (pkgs.nodePackages_latest)
    purescript-language-server purs-tidy
    purty purescript-psa pscid pulp;
  lib = plib;
  psa = purescript-psa;
  spago = versions.spago-0_20_9;
  purs = versions.purs-0_15_7;
}
