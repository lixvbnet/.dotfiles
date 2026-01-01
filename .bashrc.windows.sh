## This file contains OS spefic settings for Windows

# If in IDEA, also export WT_SESSION so that some programs consider it Windows Terminal
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]; then
    export WT_SESSION=1
fi