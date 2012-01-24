
add_dir_to_path() {
    for dir in $@; do
        # Only add dirs that exists
        if [ -e $dir ]; then
            PATH=$PATH:$dir
        fi
    done
} # end add_dir_to_path

# XXX
PATH=$HOME/local/stow/ruby-1.9.3.0/bin:$PATH

# defaults
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin

# local tools
add_dir_to_path $HOME/local/bin $HOME/bin

if [ "$SYSTEM" = "Darwin" ]; then
    add_dir_to_path /Developer/usr/bin
elif [ "$SYSTEM" = "AIX" ]; then
    PATH=$PATH:/gsa/ausgsa/projects/a/aixtools/bin
    PATH=$PATH:/usr/contrib/bin
    PATH=$PATH:/usr/java5/bin
    PATH=$PATH:/opt/freeware/bin
fi

export PATH
