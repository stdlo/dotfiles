{ fetchurl, installShellFiles, stdenv }:

stdenv.mkDerivation rec {
  name = "kubectl-${version}";
  version = "1.27.10";

  src = fetchurl {
    url = "https://dl.k8s.io/release/v${version}/bin/darwin/arm64/kubectl";
    sha256 = "sha256-CWxY0IWboENzmlVFZwAy3iqPIlcfEncdMW3R0/QPEBQ=";
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
