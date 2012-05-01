#!/usr/bin/env bash                                                              

SYSTEM=`uname`

BASH_CONFIG_DIRECTORY=$HOME/.bash

BASH_LIB_DIRECTORY=$BASH_CONFIG_DIRECTORY/lib
BASH_PLUGIN_DIRECTORY=$BASH_CONFIG_DIRECTORY/plugins

LIBRARIES=(path defaults colors git-completion)

# Source all the files in a given directory with the .bash extension             
# $1 = directory to search
function source_directory {
    local dir=$1

    if [ -e "$dir" ]; then
        if [ -d "$dir" ]; then                                                                                  
            files=`find $dir -follow -name '*.bash' -print`                      
                                                                                                                
            for f in $files; do                                                                                 
                source $f                                                                                       
            done                                                                                                
        fi                                                                                                      
    fi                                                                                                          
                                                                                                                
    return 0                                                                                                    
} # end source_directory                                                                                        
                                                                                                                
                                                                                                                
                                                                                                                
################################################################################ 
# Main                                                                                                          
################################################################################ 

if [ -e $BASH_CONFIG_DIRECTORY ] ; then                                                                         
    # Load Libs                                                                                                 
    for lib in "${LIBRARIES[@]}"; do                                                                            
        source $BASH_LIB_DIRECTORY/$lib.bash                                                                    
    done                                                                                                        
                                                                                                                
    # Load Plugins                                                                                              
    source_directory $BASH_PLUGIN_DIRECTORY                                                                     
fi                                                                                                              
                                                                                                                
# Options                                                                                                       
set -o vi                                                                                                       

if [ -e $HOME/etc/terminfo ]; then
    export TERMINFO=$HOME/etc/terminfo
fi
                                                                                                                
alias source_bash="source $HOME/.bashrc"                           

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
