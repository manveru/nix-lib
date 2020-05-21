# Nix Lib

This is a copy of the lib directory from
[nixpkgs](https://github.com/NixOS/nixpkgs) for inclusion in flakes that don't
need the rest of the repository.

## TODO

* Get rid of references to `pkgs` where possible.
* Get rid of deprecated functions
* Expose the tests in better way way.
* Automate updating to new nixpkgs-unstable tags.
* Find flakes alternative for the unpinned nix-shell shebang in `update.sh`
