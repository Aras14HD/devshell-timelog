{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "devshell-timelog";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Aras14HD";
    repo = pname;
    rev = version;
    hash = lib.fakeHash;
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
