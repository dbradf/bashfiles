
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
PATH=$HOME/local/bin:$HOME/bin:$PATH

if [ "$SYSTEM" = "Darwin" ]; then
    add_dir_to_path /Developer/usr/bin
elif [ "$SYSTEM" = "AIX" ]; then
    PATH=$PATH:/gsa/ausgsa/projects/a/aixtools/bin
    PATH=$PATH:/usr/contrib/bin
    PATH=$PATH:/usr/java5/bin
    PATH=$PATH:/opt/freeware/bin
    PATH=$PATH:/gsa/ausgsa/projects/n/nxt/git/bin
    MANPATH=$MANPATH:/opt/freeware/man
fi

export PATH MANPATH
