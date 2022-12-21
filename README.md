# Dotfiles

Bootstrap my terminal configurations and general OS configs for development :)

## Install

```sh
git clone git@github.com:luisjmarrero/dotfiles.git .dotfiles
```

### On MacOS

```sh
./setup_mac.sh
```

## Final Result View

![Result](_assets/result.png)

> `neofetch --disable resolution uptime title`

## General Structure

```
 ~
└──  .dotfiles
    ├──  amethyst
    │  └──  amethyst.yml
    ├──  bin
    │  ├──  install_amethyst.sh
    │  ├──  install_brew.sh
    │  ├──  install_brew_packages.sh
    │  ├──  install_sdkman.sh
    │  ├──  install_starship.sh
    │  └──  install_zsh_plugins.sh
    ├──  starship
    │  └──  starship.toml
    ├──  zsh
    │  ├──  alias.zsh
    │  ├──  rc.zsh
    │  └──  work.zsh
    └──  setup_mac.sh
```

> gerate view: `lt --level=2 --sort=type --git-ignore --ignore-glob=".git*|README.md|plugins|*assets*"`

## Tools