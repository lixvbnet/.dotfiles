## This file contains OS spefic settings for Windows

alias lab='jupyter lab -y --notebook-dir=/e/Documents/jupyter/'
alias uvsh='source .venv/Scripts/activate'
export UV_CACHE_DIR='/e/Temp/uv-cache'

# The awslocal python script has path issues in Windows. Simply use the alias (without DEFAULT_REGION env) instead.
alias awslocal="AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"

# If in IDEA, also export WT_SESSION so that some programs consider it Windows Terminal
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]; then
    export WT_SESSION=1
fi
