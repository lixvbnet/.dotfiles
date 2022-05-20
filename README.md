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

To install, run the following commands from your terminal: (you may want to backup your
existing `~/.tmux.conf` first)

```
ln -sf ~/.dotfiles/.tmux.conf ~/
ln -sf ~/.dotfiles/.tmux.conf.local ~/
```

### Start tmux when open shell

- Approach 1 (will affect shell script)

> [How can I set my default shell to start up tmux](https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux) 

Add following content to `~/.bash_profile` or `~/.bashrc` 

```shell
# keep at most 1 client to main, otherwise create new session
alias tm='tmux list-clients | grep main &> /dev/null && tmux || tmux new -A -s main'
# clear all sessions except current
alias tmcls='tmux kill-session -a'
# clear all sessions
alias tmclear='tmcls && tmux kill-session'

# open tmux if available
if command -v tmux &> /dev/null \
  && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ] \
  && [ -z "$VSCODE_CWD" ] && [ "$TERM_PROGRAM" != "vscode" ] \
  && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # env > ~/env.txt
  if tmux list-clients | grep "main" &> /dev/null; then
    exec tmux
  else
    exec tmux new -A -s main
  fi
fi
```

> A workaround to read output messages of click-and-run scripts is to append following lines in those scripts:
>
> ```shell
> if [ -n "$TMUX" ]; then
>   echo
>   read -n 1 -s -r -p "Press any key to continue..."
> fi
> ```

- Approach 2 (won't affect shell script)

Open Settings of Terminal app, go to "Profile" - "Shell", in "Start" section, check "Run command" and type in `tm` .



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
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
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
> Download from https://github.com/JohnnyMorganz/StyLua/releases 



Uninstall

```shell
rm -rf ~/.config/nvim/plugin
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

