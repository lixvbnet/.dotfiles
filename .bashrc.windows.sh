## This file contains OS spefic settings for Windows

alias lab='jupyter lab -y --notebook-dir=/e/Documents/jupyter/'
alias uvsh='source .venv/Scripts/activate'
export UV_CACHE_DIR='/e/Temp/uv-cache'


# In Windows, pointing to LocalStack in the VM. Because Docker for Windows, which uses WSL2, makes the OS quite unstable.
export LOCALSTACK_HOST=192.168.10.3


# If in IDEA, also export WT_SESSION so that some programs consider it Windows Terminal
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]; then
    export WT_SESSION=1
fi
