## NVIM Initial Configuration



### Install

> Must have  `g++` and `go` in PATH for installing some plugins as well as gopls LSP.
>
> ```shell
> # CentOS 7 (Don't use 'yum install gcc' since it installs gcc4.8, which is too old!)
> ## install SCL
> yum install centos-release-scl
> ## remove existing gcc4.8 (including g++)
> yum remove gcc
> ## search available versions
> yum search devtoolset
> ## install gcc (including g++)
> yum install devtoolset-11 -y
> ## test version
> scl enable devtoolset-11 'gcc -v'
> ## make it permanently enabled upon next login (can use 'gcc' directly next time)
> echo "source scl_source enable devtoolset-11" > /etc/profile.d/scl_enable.sh
> 
> # CentOS 8
> yum install -y gcc-c++ go-toolset
> ```

```shell
make install_nvim_conf
```

> Other dependencies ( **optional** )
>
> - `ripgrep` (required by telescope live grep)
>
> ```shell
> # Mac
> brew install ripgrep
> # CentOS 7/8
> yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
> yum install -y ripgrep
> ```
>
> - `stylua` (Lua code formatter)
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

