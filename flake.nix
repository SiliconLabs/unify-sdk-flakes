{
  description = "SiliconLabs cpc-daemon";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, utils, ... }:
    let
      localOverlay = import ./overlay.nix;

      pkgsForSystem = system: import nixpkgs {
        overlays = [ localOverlay ];
        inherit system;
      };
    in
    utils.lib.eachSystem [ "x86_64-linux" ]
      (system: rec {
        legacyPackages = pkgsForSystem system;
        packages = utils.lib.flattenTree {
          inherit (legacyPackages) cpcd;
        };
        apps.cpcd = utils.lib.mkApp { drv = packages.cpcd; };
        defaultPackage = packages.cpcd;
      }) // {
      overlays = {
        default = localOverlay;
      };
    };
}
