## This file contains common settings for both MacOS and Linux
## OS spefic settings should be put into ~/.bashrc.{darwin|linux}
## Custom settings should be put into ~/.bashrc.local
LANG="en_US.UTF-8"


############################ ALIAS #############################
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias grep='grep --color'
alias rm='rm -i'

alias linguist='enry'
alias lg='lazygit'
alias lab='jupyter lab -y --notebook-dir=~/Documents/jupyter/'


## mitmproxy aliases
export SYS_PROXY="127.0.0.1:7890"
export MITM_PROXY="127.0.0.1:8080"
alias show_proxy='test -n "$http_proxy" && echo $http_proxy; test -n "$https_proxy" && echo $https_proxy; test -n "$all_proxy" && echo $all_proxy'
alias set_sys_proxy='export http_proxy=http://${SYS_PROXY} https_proxy=http://${SYS_PROXY} all_proxy=socks5://${SYS_PROXY}'
alias set_mitm_proxy='export http_proxy=http://${MITM_PROXY} https_proxy=http://${MITM_PROXY} all_proxy=socks5://${MITM_PROXY}'
alias unset_proxy='unset https_proxy http_proxy all_proxy'

alias mitm='mitmweb --mode upstream:http://${SYS_PROXY}'



## TMUX ALIASES
# keep at most 1 client to main, otherwise create new session
alias tm='tmux list-clients 2>/dev/null | grep -q main && tmux || tmux new -A -s main'
# clear all sessions except current
alias tmcls='tmux kill-session -a'
# clear all sessions
alias tmclear='tmcls && tmux kill-session'


############################# PATH #############################
PATH=$PATH:~/bin:~/go/bin:~/.cargo/bin
PATH=/usr/local/goroot/bin:/usr/local/go/bin:$PATH
PATH=$PATH:/usr/local/node/bin
PATH=$PATH:/usr/local/mysql/bin:/usr/local/mysql/support-files
export PATH

# Default Settings. Override on demand
#export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)     # deprecated: sometimes very SLOW
#export JAVA_HOME=/usr/local/java/jdk


export M2_HOME=/usr/local/maven
export PATH=$PATH:$M2_HOME/bin
# export MAVEN_OPTS="-Dmaven.test.skip=true -Dfindbugs.skip=true -Dcheckstyle.skip=true -Dpmd.skip=true"
export MAVEN_OPTS="-Dfindbugs.skip=true -Dcheckstyle.skip=true -Dpmd.skip=true"


########################### SETTINGS ###########################
#export NG_CLI_ANALYTICS=ci
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"


################## Source ~/.bashrc.${os}.sh ###################
os=$(uname | awk '{print tolower($0)}')
if [ -f ~/.bashrc.${os}.sh ]; then
    . ~/.bashrc.${os}.sh
fi
#################### Source ~/.bashrc.local ####################
if [ -f ~/.bashrc.local.sh ]; then
    . ~/.bashrc.local.sh
fi
