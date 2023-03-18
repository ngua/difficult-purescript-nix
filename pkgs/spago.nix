# Parts of this module were adapted from https://github.com/justinwoo/easy-purescript-nix,
# licensed under MIT, (c) Justin Woo
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
      chmod u+w "$SPAGO"
      patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath ${lp} "$SPAGO"
      chmod u-w "$SPAGO"
    '';
  mkUrl = sys:
    "https://github.com/purescript/spago/releases/download/${version}/${sys}.tar.gz";
in
stdenv.mkDerivation rec {
  inherit version;
  pname = "spago";
  src =
    let
      urls = rec {
        x86_64-linux = { url = mkUrl "Linux"; sha256 = sha256s.x86_64-linux; };
        x86_64-darwin = { url = mkUrl "macOS"; sha256 = sha256s.x86_64-darwin; };
      };
    in
    builtins.fetchurl urls.${system} or (throw "${system}: not supported");
  dontStrip = true;
  buildInputs = [ zlib gmp ncurses5 stdenv.cc.cc.lib ];
  libPath = lib.makeLibraryPath buildInputs;
  unpackPhase = ''
    mkdir -p "$out/bin"
    tar xf "$src" -C "$out/bin"
    SPAGO="$out/bin/spago"
    ${patchelf libPath}
    mkdir -p "$out/etc/bash_completion.d/"
    "$SPAGO" --bash-completion-script "$SPAGO" \
      > "$out/etc/bash_completion.d/spago-completion.bash"
  '';

  meta = {
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
