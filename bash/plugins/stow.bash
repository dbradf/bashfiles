

export PATH=$PATH:$HOME/local/bin

STOW_DIRECTORY=$HOME/local/stow

stow() {
    local rc

    cd $STOW_DIRECTORY
    xstow $@
    rc=$?
    cd - > /dev/null 2>&1

    return $rc
} # end stow()
