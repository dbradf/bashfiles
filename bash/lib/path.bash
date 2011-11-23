
# defaults
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin

# local tools
PATH=$HOME/local/bin:$PATH
PATH=$HOME/bin:$PATH

if [ "$SYSTEM" = "Darwin" ]; then
    PATH=$PATH:/Developer/usr/bin
fi
