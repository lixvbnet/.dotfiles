## NVIM Initial Configuration



### Install

> Must have  `g++` and `go` in PATH for installing some plugins as well as gopls LSP.
>
> ```shell
> # CentOS 8
> yum install -y gcc-c++ go-toolset
> ```

```shell
make install_nvim_conf
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



### Uninstall

```shell
make clean_nvim_conf
```

