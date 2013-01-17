

set_cscope() {
    local dir=$(pwd)

    if [ -n "$1" ]; then
        dir=$1
    fi

    export CSCOPEDB=$dir/cscope.out
    export CSCOPEFILELIST=$dir
}
