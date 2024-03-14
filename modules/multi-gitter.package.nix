{ fetchzip, installShellFiles, stdenv }:

stdenv.mkDerivation rec {
  name = "multi-gitter-${version}";
  version = "0.51.0";

  src = fetchzip {
    url = "https://github.com/lindell/multi-gitter/releases/download/v${version}/multi-gitter_${version}_Darwin_ARM64.tar.gz";
    sha256 = "sha256-BWrflSNGpouM6z5/DMFbqEQkjT14SjaTNIr2vAPkm8E=";
    stripRoot = false;
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
  install -m755 -D $src/multi-gitter $out/bin/multi-gitter
  installShellCompletion $src/completions/multi-gitter.{bash,fish,zsh}
  '';
}
