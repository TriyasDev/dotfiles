{
  description = "Configuration nixos00";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
  nixosConfigurations.nixos00 = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
        {
         home-manager.useGlobalPkgs = true;
         home-manager.useUserPackages = true;
          home-manager.users.iyass = import ./home/home.nix;
        }
      ];
    };

    homeConfigurations."iyass" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
     modules = [ ./home/home.nix ];
    };
  };
}
