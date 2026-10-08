# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs) lib;
    withSystem = f:
      lib.foldr lib.recursiveUpdate {}
      (map f ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"]);
  in
    withSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.${system}.default =
          pkgs.mkShell
          {
            packages = with pkgs; [
              nodejs_22
            ];
            # Use the project's own Angular CLI (installed by `npm install`)
            shellHook = ''
              export PATH="$PWD/node_modules/.bin:$PATH"
            '';
          };
      }
    );
}
