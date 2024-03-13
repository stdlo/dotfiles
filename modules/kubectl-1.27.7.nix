{ stdenv }:
stdenv.mkDerivation {
  name = "kubectl-1.27.7";

  src = builtins.fetchurl {
    url = "https://dl.k8s.io/release/v1.27.7/bin/darwin/aarch64/kubectl";
    sha256 = "sha256-PQj9kja6rZ7VAlxzaTRmxgIM+gLioVymwjay6/8IBYI=";
  };

  dontUnpack = true;

  installPhase = ''
  mkdir -p $out/bin
  install -m755 -D $src $out/bin/kubectl
  '';
}
