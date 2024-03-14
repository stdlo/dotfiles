<h1 align="center">dotfiles ❤</h1>
<p align="center"><i>managed with <a href="https://github.com/nix-community/home-manager">nix home-manager</a></i></p>

Requires nix with flakes enabled. I'm using the [Determinate Systems installer](https://determinate.systems/posts/determinate-nix-installer/)
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Bootstrap home-manager
```sh
nix run github:nix-community/home-manager -- switch --flake .
```
