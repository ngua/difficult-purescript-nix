{ pkgs, ... }:

let
  inherit (pkgs) lib;
  mkPurs =
    let
      shortVersion = x:
        lib.strings.removePrefix "v" (builtins.replaceStrings [ "." ] [ "_" ] x);
    in
    version: sha256s:
      lib.nameValuePair
        ("purs-${shortVersion version}")
        (pkgs.callPackage ./purs.nix { inherit version sha256s; });
in
lib.mapAttrs' mkPurs {
  "v0.15.7" = {
    x86_64-linux = "sha256-s1BH/9340Yz3OJL3uVHLCQiAs81IV1QAXj9NQ2bGUgw=";
    x86_64-darwin = "sha256-27R0nuQMclmlCh3E3LHrMHvzEXlDLqzNoYWZP1LWBSs=";
  };
  "v0.15.6" = {
    x86_64-linux = "sha256-E+DM2Ug6d+tmM3Nth2yDOjGW+AmaFlqDeyV/svuLg+8=";
    x86_64-darwin = "sha256-Xawnn2J7x0pHtI3uSIXERry62998YuUgeVSn+3qqhJI=";
  };
  "v0.15.4" = {
    x86_64-linux = "sha256-zQjWP2LH/LVTYRNS8H/QA78rrzI5qq0YReRelJhhemY=";
    x86_64-darwin = "sha256-PipZ26xJVkt87ttbEC7s8rCyR2Xb/MHu1axOo5bG5o4=";
  };
  "v0.15.3" = {
    x86_64-linux = "sha256-2zmIPCLa2eGkEXTQzfA4kFEbo7NPk5z8JLIJDGhpdyA=";
    x86_64-darwin = "sha256-AxBLpNUD0ZIS2x89M2HMV1AmGJnLzToNX4pNpYIcagY=";
  };
  "v0.15.2" = {
    x86_64-linux = "sha256-FVQbrpt9824iJFSnnh/XQVcyTp8tEsD3M/yzmJeZZ9w=";
    x86_64-darwin = "sha256-kGBVfDwChrEiLl+eSxBcpv1KA5Kty8LUsNhtZ33C2hk=";
  };
  "v0.15.0" = {
    x86_64-linux = "sha256-/VL0k0Xrp+a/++vdLEbuqlnxZpKB4IB5CX7QtzY39/k=";
    x86_64-darwin = "sha256-azqglq59JnuOUgBIV/gTIfskou2HTTsqAuw7oxa/qSU=";
  };
  "v0.14.9" = {
    x86_64-linux = "sha256-c/qjAeJrsuhgJce9xfmDItics+X/lnDUPvsthaBSPDw=";
    x86_64-darwin = "sha256-ZCXWPtDWxKT9KscziqaxJDaTnn+/nRR3N1Uk2HwHc/8=";
  };
  "v0.14.7" = {
    x86_64-linux = "sha256-yuFqABfGP9g+ApyloBy5/ALKzb2AWx0rJI+bs8Pqkm0=";
    x86_64-darwin = "sha256-LKPoWbb0R2Dfw5rtLI/+ZdqTltQ2s0yAj08eWHY/gF0=";
  };
  "v0.14.6" = {
    x86_64-linux = "sha256-4yqYvZhtRYz2JOYYJM4AmxWWP3nabUHxXOtjRdUj1Hk=";
    x86_64-darwin = "sha256-6bR83C76DHM/LyFTy+mFU9wuXaJLw6GMWhjKpEBBrgY=";
  };
  "v0.14.5" = {
    x86_64-linux = "sha256-mh9Kb0111KqlfGIlQZ9b0Nr+ikgOgWcmAzj7CIbdfdc=";
    x86_64-darwin = "sha256-+7q31FUdKFgFi6cVp+rZCC6WapYaUJcA0pSzkf9dO68=";
  };
  "v0.14.4" = {
    x86_64-linux = "sha256-oKZnQREOU+hxOLlSRNSMLqIwI96UjvnFGgd9UaiB+kE=";
    x86_64-darwin = "sha256-ybG8nDwEGvjTV+Uq5iX8xk+GMjYA2PuLAA0k5Mri31Q=";
  };
  "v0.14.3" = {
    x86_64-linux = "sha256-4KLhxA4EHKYFgQLjGFpY1QF/dw1E4n75egS15670EpU=";
    x86_64-darwin = "sha256-UuvJhnd4wSOm4lbReUdCv+WvHhh++OA6GACOPs3V88Y=";
  };
  "v0.14.2" = {
    x86_64-linux = "sha256-fOrrDdLilPGcuI8jO7oMAtzE+pGTspzX4LQgbkNtZ88=";
    x86_64-darwin = "sha256-7mOLhKLpX1dk+OHCEs0NAtutZ5Rbpjvs9y2cvJKFQr0=";
  };
  "v0.14.1" = {
    x86_64-linux = "sha256-W2QYMt9EH+UJuLbZhT2aKcdSqG3NDJUpQ9xhrAAtb8g=";
    x86_64-darwin = "sha256-Gx4ebIOmjc69luAvd6a4AVtDl2MuNMxfC9dea5y9XdQ=";
  };
  "v0.14.0" = {
    x86_64-linux = "sha256-UD589/kXaSPmFDE9B2T/fcaslN35DOcMnk2sT3s9cdA=";
    x86_64-darwin = "sha256-ekj9IXGfkN12PfoAfwJQfL55+Tau8M36fvv9k1Wx1jU=";
  };
}