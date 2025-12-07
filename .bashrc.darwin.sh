## This file contains OS spefic settings for MacOS

alias ls='ls -G'

export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine"

# fix pipenv SSL cert issue in MacOS
command -v python3 &> /dev/null && export REQUESTS_CA_BUNDLE=$(python3 -m certifi) &> /dev/null || true


################# TMUX (SHOULD BE PUT AT LAST) #################
start_tmux() {
  # env > ~/env.txt
  if tmux list-clients 2>/dev/null | grep -q "main"; then
    exec tmux
  else
    exec tmux new -A -s main
  fi
}

# open tmux if available
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # start tmux if it's not in IDEA or VSCode, or iTerm2 or kitty
  if [ -z "$INTELLIJ_ENVIRONMENT_READER" ] && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ] \
    && [[ ! "$LC_TERMINAL" =~ iTerm2 ]] && [[ ! "$TERM" =~ kitty ]] \
    && [ -z "$VSCODE_CWD" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
    start_tmux
  fi
fi


# ======== Snippets for Reference ========
## not iTerm2 or kitty (now removed - i.e. Enabling tmux for iTerm2 and kitty)
# && [[ ! "$LC_TERMINAL" =~ iTerm2 ]] && [[ ! "$TERM" =~ kitty ]] \

## not Apple built-in terminal
# && [[ ! "$TERM_PROGRAM" =~ Apple ]] \

## for apple terminal, only start tmux if os version < 13
# if [[ "$TERM_PROGRAM" =~ "Apple" ]]; then
#     if [[ $(sw_vers -productVersion | cut -d. -f1) -lt 13 ]]; then
#       start_tmux
#     fi
# fi
