{ pkgs
, plib
, ...
}:

let
  inherit (pkgs) lib;
in
plib.foldMergeAttrs
  [
    (
      lib.mapAttrs' (plib.mkNpmFetch "purescript-language-server") {
        "0.17.1" = "sha256-xYndEBqO5QSluGJQW8CtmgGbsQBKQ4Qq+dZSoFxdC6Y=";
        "0.16.6" = "sha256-2INDRzyJ4F6X1Uu3sUj8klqZf5qibf4ZBy1detZ6UKE=";
      }
    )

    (
      lib.mapAttrs' (plib.mkNpmFetch "purs-tidy") {
        "0.7.2" = "sha256-mTd6mn9tbFCZP2G7gjWVb3wzaWWJAn0X5RUHOdrr6TY=";
      }
    )

    (
      lib.mapAttrs' (plib.mkNpmFetch "pulp") {
        "15.0.0" = "sha256-nFE9+FyoPqmvw7zISuQqCs3hPNoB+G44YHqzl7jpiGU=";
      }
    )

    (
      lib.mapAttrs' plib.mkSpago {
        "0.20.9" = {
          x86_64-linux = "sha256-FQBjake5UcediFcg0Anq7tmbGQuXn6NhbeSVTkOmMDU=";
          x86_64-darwin = "sha256-Cf8mBu4BMhRgHNLU/sOuLPCUHtoPAg7VLcYOkdsl0bA=";
        };
        "0.20.8" = {
          x86_64-linux = "sha256-GW6gT07nzdvRJxRvZpMlT8Szl2JA15BGteP9aDwhH8Y=";
          x86_64-darwin = "sha256-BzDSxVYWpuDS0xTNzxf1vmReevrVBPEmH2A4dYTrmoE=";
        };
        "0.20.7" = {
          x86_64-linux = "sha256-anbUnX7g1X34Ut+x6yQ8S/U89lT2RuziNGA8F3IrAS4=";
          x86_64-darwin = "sha256-ivZ07sSKf9Dt4IJcqsB4Xm0TbP3gwAP9Vpo+PMl/v2g=";
        };
        "0.20.5" = {
          x86_64-linux = "sha256-wIuZJIxas5DGlNduVp3WLqoTO4+yvcdVcWC8sbEQLMw=";
          x86_64-darwin = "sha256-wiq6ljlj3YNl6cAI1Elz/tZP4ma4VIM8jN/JZ+2y5Hk=";
        };
        "0.20.4" = {
          x86_64-linux = "sha256-Aq3bUXomSodKyeag4FgM6HQiEG3qqWR5fWcow6hUU2M=";
          x86_64-darwin = "sha256-uzoknbKeTnE52Cg9iVX8oxU4ordCpmevWf+JObvO9XA=";
        };
        "0.20.3" = {
          x86_64-linux = "sha256-gf28L6AXBYeOyankM9/AJQGwRmr8opG6ycE3zO09Rrw=";
          x86_64-darwin = "sha256-PvzEBbzo3BvQRHV/4VAX/lIuJFQ/7wz0dobiIjPciH8=";
        };
        "0.20.2" = {
          x86_64-linux = "sha256-ybuNcFeaclyRYz5z59qhB5Umz2sLYQduu87E58QLnTQ=";
          x86_64-darwin = "sha256-ecv2sDLT7tY9itkagvFDQxtv7j7eee4h+HDFzpiCrWo=";
        };
        "0.20.1" = {
          x86_64-linux = "sha256-A4onH1hrVxXV4fPCyGp3U2odZd2FyVLhGMNBMxg4IiE=";
          x86_64-darwin = "sha256-tmTqe5LP8OYCI5PirAmmUZ02+AIUDy9Rn5XDQNL6h2w=";
        };
        "0.20.0" = {
          x86_64-linux = "sha256-cwAuNcHB1Geeb8woPpwq1SwCF48oAHyzSBup1m1D+Rw=";
          x86_64-darwin = "sha256-/HS6U/4X1NSfr3XOXTTidyPquVh+ph2R9W9bXCy2sdM=";
        };
      }
    )

    (
      lib.mapAttrs' plib.mkPurs {
        "v0.15.7" = {
          x86_64-linux = "sha256-s1BH/9340Yz3OJL3uVHLCQiAs81IV1QAXj9NQ2bGUgw=";
          x86_64-darwin = "sha256-27R0nuQMclmlCh3E3LHrMHvzEXlDLqzNoYWZP1LWBSs=";
        };
        "v0.15.6" = {
          x86_64-linux = "sha256-E+DM2Ug6d+tmM3Nth2yDOjGW+AmaFlqDeyV/svuLg+8=";
          x86_64-darwin = "sha256-Xawnn2J7x0pHtI3uSIXERry62998YuUgeVSn+3qqhJI=";
        };
        "v0.15.4" = {
          x86_64-linux = "sha256-PipZ26xJVkt87ttbEC7s8rCyR2Xb/MHu1axOo5bG5o4=";
          x86_64-darwin = "sha256-zQjWP2LH/LVTYRNS8H/QA78rrzI5qq0YReRelJhhemY=";
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
          x86_64-linux = "sha256-6bR83C76DHM/LyFTy+mFU9wuXaJLw6GMWhjKpEBBrgY=";
          x86_64-darwin = "sha256-4yqYvZhtRYz2JOYYJM4AmxWWP3nabUHxXOtjRdUj1Hk=";
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
    )
  ]
