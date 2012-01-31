

export SANDBOX_DIRECTORY=/gsa/ausgsa/home/d/a/davidbra/sb

# Setup shortcuts
alias cdserv='cd $BASE/src/bos/kernext/pool/server'
alias cdpfs='cd $BASE/src/bos/kernext/pool/server/pfs'

alias cdbt="cd src link/src"
alias cdbtt="cd src link/link/src"

alias cdobj="cd src obj/power"
alias cdsrc="cd obj/power src"

alias cdbase='cd $BASE'
alias cdbsrc='cd $BASE/src'

alias rmsb="mksb -undo -auto"

alias debug=/gsa/ausgsa/home/d/a/daco/pub/debug


# Wrapper around workon to set some env variables
workonsb() {
    local sb=$1
    local aixtools=/gsa/ausgsa/projects/a/aixtools/bin
    local mybin=/gsa/ausgsa/home/d/a/davidbra/bin

    if [ -z "$sb" ]; then
        echo "Usage: `basename $0` <sandbox_name>" >&2
        exit 1
    fi

    # Setup new path
    #export PATH=$PATH:$aixtools:$mybin

    export CMVC_TOP=$SANDBOX_DIRECTORY/$sb
    export CSCOPEDB=$CMVC_TOP/cscope.out
    export CSCOPEFILELIST=$CMVC_TOP


    workon -sb $sb
} # end workonsb()


# List available sandboxes
lssb() {
    ls -1 $SANDBOX_DIRECTORY
} # end lssb()


# Call workon command if available, otherwise just start a new shell in the
# given sandboxes src directory.
workon() {
    local sb=
    local workon_bin

    workon_bin=`which workon`
    if [ $? -eq 0 ]; then
        $workon_bin $@
        return 0
    fi

    shift

    sb=$1
    if [ -z "$sb" ]; then
        echo "ERROR: Missing sandbox" >&2
        echo "Usage: workon -sb <sandbox>" >&2

        exit 1
    fi

    export BASE=$SANDBOX_DIRECTORY/$sb

    cd $BASE/src
    bash  -i
    cd - > /dev/null
    unset BASE
} # end workon
