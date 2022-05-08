# .dotfiles
```shell
cd
git clone https://github.com/lixvbnet/.dotfiles.git
```

## TMUX
> [gpakosz/.tmux](https://github.com/gpakosz/.tmux) with customized config.

To access system clipboard, need to:
```shell
# Mac
brew install reattach-to-user-namespace
# Linux
yum install -y xsel xclip
```
> Note: [Cannot copy to my system clipboard when I run tmux on a remote server and connect using SSH](https://github.com/gpakosz/.tmux/issues/119)
>
> A workaround: first `prefix, m` to disable mouse mode, `prefix, z` to zoom/maximize current pane, then select and copy (Now mouse events are handled by your terminal app).

For Mac Terminal, need first go to Preferences -> Profiles -> Keyboard, check "Use Option as Meta key", and add following key bindings in the list (Action choose "Send text", press "ESC" for `\033`)

> Reference: [OS X terminal eating the shift key](https://superuser.com/questions/841391/os-x-terminal-eating-the-shift-key) 
>
> `\033` is ESC, `[1;2` is ⇧, `[1;5` is ⌃ , `A` is ⬆️, `B` is ⬇️, `C` is ➡️, `D` is ⬅️

- ⇧ + up:   `\033[1;2A` 
- ⇧ + down: `\033[1;2B` 

To install, run the following from your terminal: (you may want to backup your
existing `~/.tmux.conf` first)

```
ln -sf ~/.dotfiles/.tmux.conf ~/
ln -sf ~/.dotfiles/.tmux.conf.local ~/
```

## NVIM
> [NvChad](https://nvchad.github.io/) customized config.

```shell
ln -sf ~/.dotfiles/nvchad/custom ~/.config/nvim/lua/
```
