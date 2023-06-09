{
  description = "difficult-purescript-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, flake-parts, treefmt-nix, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [
        flake-parts.flakeModules.easyOverlay
        treefmt-nix.flakeModule
      ];

      perSystem = { config, pkgs, lib, system, ... }:
        rec {
          legacyPackages = {
            purescriptPackages = import ./pkgs { inherit pkgs lib; };
          };

          packages = builtins.removeAttrs
            self.legacyPackages.${system}.purescriptPackages
            [ "lib" ]
          ;

          checks = {
            statix = pkgs.runCommand "statix"
              {
                nativeBuildInputs = [ pkgs.statix ];
              }
              ''
                cd ${self}
                statix check
                touch $out
              '';
            packages = pkgs.runCommand "all-packages"
              {
                ps = builtins.attrValues self.packages.${system};
              }
              ''
                echo $ps
                touch $out
              '';
          };

          treefmt.config = {
            projectRootFile = "flake.nix";
            programs.nixpkgs-fmt.enable = true;
          };

          overlayAttrs = {
            inherit (self.legacyPackages.${system}) purescriptPackages;
          };
        };
    };
}
