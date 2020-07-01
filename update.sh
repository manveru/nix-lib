#!/usr/bin/env nix-shell
#!nix-shell --pure -p gitMinimal nixFlakes cacert fd nixfmt -i bash
# shellcheck shell=bash

set -e

repo="NixOS/nixpkgs-channels"
url="https://github.com/$repo"
channel="nixpkgs-unstable"
rev="$(git ls-remote "$url" "$channel" | cut -f1)"
expr="(builtins.getFlake ''github:$repo/$rev'').outPath"
nixpkgs=$(nix eval --experimental-features 'nix-command flakes ca-references' --raw --expr "$expr")

for d in lib maintainers .version COPYING; do
  rm -rf "$d"
  cp -r "$nixpkgs/$d" $d
  chmod u+w -R "$d"
done

rm -rf maintainers/scripts

fd -e nix -X nixfmt

set +e

git add lib maintainers .version COPYING
git -c user.name="Michael Fellinger" -c user.email="github@manveru.dev" commit -m "Update for $(date -u +%Y-%m-%d)"
git push
