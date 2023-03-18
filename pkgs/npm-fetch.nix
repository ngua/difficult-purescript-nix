{ stdenv
, nodejs
, pname
, version
, sha256
, ...
}:

stdenv.mkDerivation {
  inherit pname version;
  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  outputHash = sha256;
  nativeBuildInputs = [ nodejs ];

  unpackPhase = ''
    export HOME="$(mktemp -d npmXXX)"
    chmod +rwx "$HOME"
    mkdir -p ./node_modules
    npm i --silent ${pname}@${version} --prefix .
  '';
  buildPhase = ''
    patchShebangs ./node_modules
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp -r ./node_modules/ $out/node_modules
    ln -s $out/node_modules/.bin/${pname} $out/bin/
  '';
}
