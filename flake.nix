{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # We want to use packages from the binary cache
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ...}: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in {
      lib.timelog = pkgs.callPackage ./default.nix {};

      devShell = pkgs.mkShell {
        packages = with pkgs; [
          cargo
        ];
      };
    });
}
