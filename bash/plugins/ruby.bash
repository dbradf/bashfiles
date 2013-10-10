
# Add rbenv to the start of the path
if [ "$SYSTEM" = "Darwin" ]; then
    if [ -e "$HOME/.rbenv" ]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
        eval "$(rbenv init -)"
    fi
fi

alias man="gem man -s"

# alias for testing ruby commands 
# Uses the local lib folder for the library
alias truby="RUBYLIB=lib ruby"
