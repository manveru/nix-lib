{
  description = "A flake for the nixpkgs lib";

  outputs = { self }: {
    lib = import ./lib;
    checks = let
      nixpkgs = getFlake
        "path:/nix/store/q3ai08408xzhn9z7lziazmv23z7s935w-source?lastModified=1590755949&narHash=sha256-obN47E6A9PAtzGmBXigrf7vLWBGeuXDxYQW%2f+FTjotM=&rev=e7752db2fb6c5e05f1de2b275535dbde07d30090";
      systems = [ "x86_64-linux" ];
      inherit (builtins) getFlake listToAttrs map;
    in listToAttrs (map (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        name = system;
        value = {
          all = derivation {
            name = "check";
            system = "x86_64-linux";
            builder = "/bin/sh";
            args = [ ./check-builder.sh ];
          };
        };
      }) systems);
  };
}
