{ src
, pname
, version
, lib
, stdenv
, sha256
, buildNpmPackage
, ...
}:

buildNpmPackage rec {
  inherit pname version src;
  npmDepsHash = sha256;
  dontNpmBuild = true;
  postInstall = ''
    mkdir $out/bin
    ln -s $out/lib/node_modules/${pname}/node_modules/.bin/${pname} $out/bin/
  '';
}
