{ pkgs, ... }: {
  home.packages = with pkgs; [
    fluxcd
    fnm
    ( pkgs.callPackage ./multi-gitter.package.nix { } )
    ( if pkgs.stdenv.isDarwin
      then pkgs.callPackage ./kubectl.package.nix { }
      else kubectl )
    kubectx
    kustomize
  ];
}
