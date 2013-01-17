
add_dir_to_path() {
    local before=
    if [ "$1" = "-before" ]; then
        before=1
        shift
    fi

    for dir in $@; do
        # Only add dirs that exists
        if [ -e $dir ]; then
            if [ -n "$before" ]; then
                PATH=$dir:$PATH
            else
                PATH=$PATH:$dir
            fi
        fi
    done
} # end add_dir_to_path

# local tools
add_dir_to_path -before $HOME/local/bin $HOME/bin


if [ "$SYSTEM" = "Darwin" ]; then
    # SML
    add_dir_to_path /usr/local/smlnj-110.74/bin
    # Ruby gem binaries
    add_dir_to_path /usr/local/Cellar/ruby/1.9.3-p194/bin
    # Homebrew path
    add_dir_to_path -before /usr/local/bin
elif [ "$SYSTEM" = "AIX" ]; then
    add_dir_to_path -before /gsa/ausgsa/projects/a/aixtools/bin
    add_dir_to_path /usr/contrib/bin
    add_dir_to_path /usr/java5/bin
    add_dir_to_path /opt/freeware/bin
    add_dir_to_path -before $HOME/local/stow/ruby-1.9.3-p0/bin

    MANPATH=$MANPATH:/opt/freeware/man
fi

export PATH MANPATH
