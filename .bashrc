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

## TMUX ALIASES
# keep at most 1 client to main, otherwise create new session
alias tm='tmux list-clients 2>/dev/null | grep -q main && tmux || tmux new -A -s main'
# clear all sessions except current
alias tmcls='tmux kill-session -a'
# clear all sessions
alias tmclear='tmcls && tmux kill-session'


############################# PATH #############################
PATH=$PATH:~/bin:~/go/bin:~/.cargo/bin
PATH=$PATH:/usr/local/node/bin
PATH=$PATH:/usr/local/mysql/bin:/usr/local/mysql/support-files
export PATH

export JAVA_HOME=/usr/local/java/jdk
export M2_HOME=/usr/local/maven
export PATH=$PATH:$M2_HOME/bin
# export MAVEN_OPTS="-Dmaven.test.skip=true -Dfindbugs.skip=true -Dcheckstyle.skip=true -Dpmd.skip=true"
export MAVEN_OPTS="-Dfindbugs.skip=true -Dcheckstyle.skip=true -Dpmd.skip=true"


########################### SETTINGS ###########################
export NG_CLI_ANALYTICS=ci
export HOMEBREW_NO_AUTO_UPDATE=true
# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"


################## Source ~/.bashrc.${os}.sh ###################
os=$(uname | awk '{print tolower($0)}')
if [ -f ~/.bashrc.${os} ]; then
    . ~/.bashrc.${os}
fi
#################### Source ~/.bashrc.local ####################
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
