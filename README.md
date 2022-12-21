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

### MacOS
- [homebrew](https://brew.sh/)
- [sdkaman](https://sdkman.io/)
- [starship](https://starship.rs/)
- [amethyst](https://ianyh.com/amethyst/)

## zsh plugins

- [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)