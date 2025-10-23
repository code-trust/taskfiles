{
  description = "Codetrust shared Taskfiles";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          pname = "codetrust-taskfiles";
          version = self.rev or "dev";
          src = self;
          dontBuild = true;
          installPhase = ''
            mkdir -p $out/taskfiles
            cp -r taskfiles/* $out/taskfiles/
          '';
        };

        formatter = pkgs.nixfmt-rfc-style;
      });
}
