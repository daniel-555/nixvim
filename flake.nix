{
  description = "A minimal flake template that you can adapt to your own project";

  inputs = {
      nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
      flake-parts.url = "github:hercules-ci/flake-parts";
      nixvim ={

      url = "github:nix-community/nixvim";
      };
  };

  outputs = {nixvim, flake-parts, ...}@inputs:
  flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];

      perSystem = {system, ...}:
      let
        configuration = nixvim.lib.evalNixvim {
            inherit system;
            modules = [./nixvim.nix];

        };
        in
        {
            checks.default = configuration.config.build.test;
            packages.default = configuration.config.build.package;
        };
  };
}
