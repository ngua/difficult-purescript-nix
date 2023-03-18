{ stdenv
, lib
, zlib
, gmp
, ncurses5
, version
, sha256s
}:

let
  inherit (stdenv.hostPlatform) system;
  patchelf = lp: lib.optionalString (!stdenv.isDarwin)
    ''
      chmod u+w "$PURS"
      patchelf --interpreter ${stdenv.cc.bintools.dynamicLinker} \
        --set-rpath ${lp} "$PURS"
      chmod u-w "$PURS"
    '';
  mkUrl = sys:
    "https://github.com/purescript/purescript/releases/download/${version}/${sys}.tar.gz";
in
stdenv.mkDerivation rec {
  inherit version;
  pname = "purs";
  src =
    let
      msg = "Using the non-native x86 binary. While this binary may run under"
        + " Rosetta 2 translation, no guarantees can be made about stability or"
        + " performance.";
      urls = rec {
        x86_64-linux = { url = mkUrl "linux64"; sha256 = sha256s.x86_64-linux; };
        x86_64-darwin = { url = mkUrl "macos"; sha256 = sha256s.x86_64-darwin; };
        aarch64-darwin = builtins.trace msg x86_64-darwin;
      };
    in
    builtins.fetchurl urls.${system} or (throw "${system}: not supported");
  dontStrip = true;
  buildInputs = [ zlib gmp ncurses5 ];
  libPath = lib.makeLibraryPath buildInputs;
  installPhase = ''
    mkdir -p "$out/bin"
    PURS="$out/bin/purs"
    install -D -m555 -T purs "$PURS"
    ${patchelf libPath}
    mkdir -p "$out/etc/bash_completion.d/"
    "$PURS" --bash-completion-script "$PURS" \
      > "$out/etc/bash_completion.d/purs-completion.bash"
  '';
  meta = {
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
