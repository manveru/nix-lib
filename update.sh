#!/usr/bin/env nix-shell
#!nix-shell --pure -p gitMinimal nixFlakes cacert -i bash
# shellcheck shell=bash

set -ex

repo="NixOS/nixpkgs-channels"
url="https://github.com/$repo"
channel="nixpkgs-unstable"
rev="$(git ls-remote "$url" "$channel" | cut -f1)"
expr="(getFlake ''github:$repo/$rev'').outPath"
nixpkgs=$(nix eval --raw --expr "$expr")

for d in lib maintainers .version COPYING; do
  rm -rf "$d"
  cp -r "$nixpkgs/$d" $d
  chmod u+w -R "$d"
done

rm -rf maintainers/scripts
