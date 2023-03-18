{
  description = "spago.nix";

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
            purescriptPackages = import ./pkgs { inherit pkgs; };
          };

          packages = builtins.removeAttrs
            self.legacyPackages.${system}.purescriptPackages
            [ "lib" ]
          ;

          checks = {
            packages = pkgs.runCommand "all-packages"
              {
                ps = builtins.attrValues self.packages.${system};
              }
              ''
                echo $ps
                touch $out
              '';
          };

          formatter = treefmt-nix.lib.mkWrapper pkgs treefmt.config;

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
