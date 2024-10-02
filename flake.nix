{
  description = "Declarative local dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/24.05";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, unstable-nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        stable = import nixpkgs { inherit system; };
        unstable = import unstable-nixpkgs { inherit system; };
      in
      with stable; {
        devShell = mkShell {
          buildInputs = [
            nodejs_22
            just
          ];
        };
      });
}
