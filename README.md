# dotfiles

My Dotfiles

## Supported OS

- Ubuntu (also WSL)

## Installation

1. Clone repository

```shell
$ git clone https://github.com/uma-31/dotfiles.git "$HOME/.dotfiles"
```

2. Install dotfiles

```shell
$ cd "$HOME/.dotfiles"
$ ./bin/dotfiles install
```

3. Install some tools (optional)

- [zplug](https://github.com/zplug/zplug)
  - Plugin manager for zsh
- [pyenv](https://github.com/pyenv/pyenv)
  - Version manager for python
- [nodenv](https://github.com/nodenv/nodenv)
  - Version manager for node

4. Restart terminal or source `.zshrc`

## Usage

You can use dotfiles command to manage dotfiles.

```shell
$ dotfiles <command> [...args]
```

### Commands

| Command   | Explanation                               |
| :-------- | :---------------------------------------- |
| install   | Install dotfiles to your environment.     |
| uninstall | Uninstall dotfiles from your environment. |
