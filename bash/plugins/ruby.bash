
# Add rbenv to the start of the path
if [ "$SYSTEM" = "Darwin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
elif [ "SYSTEM" = "AIX" ]; then
    export PATH=$PATH:$HOME/local/stow/ruby-1.9.3-p0/bin
fi

alias man="gem man -s"