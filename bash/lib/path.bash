
add_dir_to_path() {
    for dir in $@; do
        # Only add dirs that exists
        if [ -e $dir ]; then
            PATH=$PATH:$dir
        fi
    done
} # end add_dir_to_path


# defaults
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin

# local tools
add_dir_to_path $HOME/local/bin $HOME/bin

if [ "$SYSTEM" = "Darwin" ]; then
    add_dir_to_path /Developer/usr/bin
fi

export PATH
