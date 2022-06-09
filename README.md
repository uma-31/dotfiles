# dotfiles

My Dotfiles.

## Supported OS

- Ubuntu (also WSL)
- Mac OS

## Installation

1. Clone repository

```shell
$ git clone https://github.com/uma-31/dotfiles.git "$HOME/.dotfiles"
```

2. Install dotfiles

```shell
$ cd "$HOME/.dotfiles"
$ ./install.sh
```

3. Install some tools (optional)

- [zplug](https://github.com/zplug/zplug)

  - Plugin manager for zsh
  - Install with:
    ```shell
    $ git clone https://github.com/zplug/zplug.git "$HOME/.zplug"
    ```

- [pyenv](https://github.com/pyenv/pyenv)

  - Version manager for python
  - Install with:
    ```shell
    $ git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
    ```

- [nodenv](https://github.com/nodenv/nodenv)

  - Version manager for node
  - Install with:
    ```shell
    $ git clone https://github.com/nodenv/nodenv.git "$HOME/.nodenv"
    ```
  - Install plugins with:
    ```shell
    $ mkdir "$HOME/.nodenv/plugins"
    $ git clone https://github.com/nodenv/node-build.git "$HOME/.nodenv/plugins/node-build"
    $ git clone https://github.com/pine/nodenv-yarn-install.git "$HOME/.nodenv/plugins/nodenv-yarn-install"
    ```

- [direnv](https://github.com/direnv/direnv)
  - Load and unload environment variables depending on the current directory.
  - Install with:
    ```shell
    $ sudo apt install direnv # Ubuntu
    $ brew install direnv     # Mac
    ```

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
