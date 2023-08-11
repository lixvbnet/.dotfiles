## TMUX Initial Configuration



### Keyboard

For Mac Terminal, need first go to Preferences -> Profiles -> Keyboard, check "Use Option as Meta key", and add following key bindings in the list (Action choose "Send text", press "ESC" for `\033`)

> Reference: [OS X terminal eating the shift key](https://superuser.com/questions/841391/os-x-terminal-eating-the-shift-key) 
>
> `\033` is ESC, `[1;2` is ⇧, `[1;5` is ⌃ , `A` is ⬆️, `B` is ⬇️, `C` is ➡️, `D` is ⬅️

- ⇧ + up:   `\033[1;2A` 
- ⇧ + down: `\033[1;2B` 

> **Note**: An easy way to show escape sequences is using `cat` command then press any key combinations. The raw key code will be printed out.



### Start tmux when open shell

- Approach 1 (will affect shell script)

> [How can I set my default shell to start up tmux](https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux) 

See [.bashrc](../.bashrc) and [.bashrc.darwin](../.bashrc.darwin) in this repo.

> A workaround to read output messages of click-and-run scripts is to append following lines in those scripts:
>
> ```shell
> if [ -n "$TMUX" ]; then
> echo
> read -n 1 -s -r -p "Press any key to continue..."
> fi
> ```

- Approach 2 (won't affect shell script)

Open Settings of Terminal app, go to "Profile" - "Shell", in "Start" section, check "Run command" and type in `tm` .



## Open links

- without tmux: ⌘ + Double Click
- with tmux: Fn + ⌘ + Double Click