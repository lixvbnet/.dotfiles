## for Windows Git Bash only.
# export PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\[\033[32m\]\[\033[32m\] → \[\033[36m\]\W\[\033[36m\]`__git_ps1`\[\033[0m\] '
# export PS1='\[\033[0m\] → \[\033[36m\]\W\[\033[31m\]`__git_ps1`\[\033[0m\] '
# WITHOUT git call (for performance)
export PS1='\[\033[0m\] → \[\033[36m\]\W\[\033[0m\] '
# env > ~/tmp/env.txt

# start zsh if in terminal and NOT in default Git Bash Term
if [ -t 1 ] && [ "$TERM_PROGRAM" != "mintty" ]; then
  exec zsh
else
  source ~/.bashrc
fi
