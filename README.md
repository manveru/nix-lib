# Nix Lib

This is a copy of the lib directory from
[nixpkgs](https://github.com/NixOS/nixpkgs) for inclusion in flakes that don't
need the rest of the repository.

## Update status

![Update](https://github.com/manveru/nix-lib/workflows/Update/badge.svg)

## TODO

* Run tests as flake checks
* Deprecated functions are tricky to remove while keeping the sync intact, so
  they remain here for now. Think of a better way to remove them.
* Find flakes alternative for the unpinned nix-shell shebang in `update.sh`
