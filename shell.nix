{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "R-shell";
  buildInputs = [
    pkgs.R
    pkgs.rPackages.ggplot2
  ];
}

