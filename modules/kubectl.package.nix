{ fetchurl, installShellFiles, stdenv }:

stdenv.mkDerivation rec {
  name = "kubectl-${version}";
  version = "1.27.7";

  src = fetchurl {
    url = "https://dl.k8s.io/release/v${version}/bin/darwin/aarch64/kubectl";
    sha256 = "sha256-PQj9kja6rZ7VAlxzaTRmxgIM+gLioVymwjay6/8IBYI=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
  install -m755 -D $src $out/bin/kubectl
  installShellCompletion --cmd kubectl \
    --bash <($out/bin/kubectl completion bash) \
    --fish <($out/bin/kubectl completion fish) \
    --zsh <($out/bin/kubectl completion zsh)
  '';
}
