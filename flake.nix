{
  description = "A flake for the nixpkgs lib";

  edition = 201909;

  outputs = { self }: {
    lib = import ./lib;
  };
}
