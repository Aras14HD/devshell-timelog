{ pkgs ? import <nixpkgs> {},lib ? pkgs.stdenv.lib, fetchFromGitHub ? pkgs.fetchFromGithub, rustPlatform ? pkgs.rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "devshell-timelog";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Aras14HD";
    repo = pname;
    rev = version;
    hash = "sha256-Qwqp620tAtRdXI9uLNRACAV6vo6mzb7F2zouTNOas84=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
