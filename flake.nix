{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux" "mingwW64"] (system:
      let pkgs =
            if system == "mingwW64"
            then nixpkgs.legacyPackages."x86_64-linux".pkgsCross.mingwW64
            else nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          sdlfoo = pkgs.callPackage ./package.nix {};
          default = sdlfoo;
        };
        apps = rec {
          sdlfoo = flake-utils.lib.mkApp { drv = self.packages.${system}.sdlfoo; };
          default = sdlfoo;
        };
      }
    );
}
