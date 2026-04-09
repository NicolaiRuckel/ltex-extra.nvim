{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem
  (system:
  let
    pkgs = import nixpkgs {
      inherit system;
    };
  in
  with pkgs;
  {
    devShells.default = mkShell {
      name = "ltex_extra-nvim-dev-shell";
      buildInputs = [
        (pkgs.writeShellScriptBin "nvim-clean" ''
        exec ${pkgs.neovim}/bin/nvim --clean "$@"
        '')
        gnumake
        selene
      ];
    };
  }
  );
}
