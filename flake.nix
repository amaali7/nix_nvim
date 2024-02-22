{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim/5c75ba30ad7595954ed4eb573d9f69b85c489a31";
    flake-parts.url = "github:hercules-ci/flake-parts";
    decay-vim = {
      url = "github:decaycs/decay.nvim";
      flake = false;
    };   
  };

  outputs = {
    nixvim,
    flake-parts,
    decay-vim,
    ...
  }@inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = (import ./config) {inherit pkgs inputs;}; # import the module directly
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
#        checks = {
          # Run `nix flake check .` to verify that your config is not broken
 #         default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
  #      };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };
      };
    };
}
