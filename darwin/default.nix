{ lib, inputs, nixpkgs, home-manager, darwin, ...}:

let
  system = "x86_64-darwin";
  user = "matthias.thym";
in
{
  ATGRZM4052534A = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = import ./home.nix;
      }
    ];
  };
}