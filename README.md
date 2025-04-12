# Nome

This is my Nix home manager configuration to easily setup any machine with all the
dev tools and configs I'll need. I call it my "Nome" for short.

## Setup

1. Download this repo to `~/.config/home-manager`. I know the repo is called
   `nome` but the folder name needs to be `home-manager`, so sorry.
2. Install the [Required tools](#required-tools).
3. Add a specific configuration for your username and hostname to [flake.nix](./flake.nix) and [./users](./users/).
4. Run this script to setup the nome:
```sh
home-manager switch
```

## Required tools <a name="required-tools"></a>

### Nix

[Nix](https://nix.dev/) installs and manages the packages configured in the
Nome. There's the official distribution of it, but I
prefer [Determinate Nix](https://github.com/DeterminateSystems/nix-installer)
for my work laptop because it handles zscaler certificates for you
automatically. I use the same installer but without the `--determinate` flag
for my personal laptop to just get the official Nix image.

Install it by running this script:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install --determinate
```


### Home Manager

[Home
Manager](https://nix-community.github.io/home-manager/index.xhtml#ch-introduction)
is needed to actually understand and use the Nome.

Install it by running this script:

```sh
nix run home-manager/master -- init --switch
```
