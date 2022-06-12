# .dotfiles
```shell
cd
git clone https://github.com/lixvbnet/.dotfiles.git
```

**Shortcut to install all config files**:

```shell
cd ~/.dotfiles && make all
```

or step by step:


```shell
cd ~/.dotfiles
# install dotfiles
make install
# install git config (require root access)
make install_git_conf
# install nvim config
make install_nvim_conf
```

> This does not include the "Initial Configuration" steps.

**Shortcut to remove all dotfiles**:

```shell
cd ~/.dotfiles && make clean
```



## BASH

```shell
ln -sf ~/.dotfiles/.bashrc ~/
os=$(uname | awk '{print tolower($0)}')
ln -sf ~/.dotfiles/.bashrc.${os} ~/
```



## TMUX

> [gpakosz/.tmux](https://github.com/gpakosz/.tmux) with customized config.

First read [TMUX Initial Configuration](./docs/tmux.md) .

To install, run the following commands from your terminal: (you may want to backup your
existing `~/.tmux.conf` first)

```
ln -sf ~/.dotfiles/.tmux.conf ~/
ln -sf ~/.dotfiles/.tmux.conf.local ~/
```



## Lazygit

> [lazygit](https://github.com/jesseduffield/lazygit) config.

```shell
# Mac
ln -sf ~/.dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/
# Linux
ln -sf ~/.dotfiles/lazygit/config.yml ~/.config/lazygit/
```



## Git config

```shell
sudo ln -sf ~/.dotfiles/etc/gitconfig /etc/
```



## NVIM

> [NvChad](https://NvChad.github.io), with customized config.

Install

> Must have  `g++` and `go` in PATH for installing some plugins as well as gopls LSP.
>
> ```shell
> # CentOS 8
> yum install -y gcc-c++ go-toolset
> ```

```shell
ln -sf ~/.dotfiles/nvim ~/.config/
nvim
```

> Other dependencies:
>
> - `ripgrep` (required by telescope live grep)
>
> ```shell
> # Mac
> brew install ripgrep
> # CentOS 8
> yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
> yum install -y ripgrep
> ```
>
> - `stylua` 
>
> ```shell
> # Mac
> brew install stylua
> # Or Download from https://github.com/JohnnyMorganz/StyLua/releases 
> ```
>
> - `lazygit` 
>
> ```shell
> # Mac
> brew install jesseduffield/lazygit/lazygit
> # Use go install
> go install github.com/jesseduffield/lazygit@latest
> # Or Download from https://github.com/jesseduffield/lazygit/releases 
> ```



Uninstall

```shell
rm -rf ~/.config/nvim/plugin
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

