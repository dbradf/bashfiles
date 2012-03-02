Bash Config                                                                      
===========                                                                                                     
                                                                                                                
This is my bash config. It is organized into 3 parts.                            
                                                                                                                
 * bashrc - This file get linked to ~/.bashrc and is used to setup some basic     
   configuration and then calls the other files.                                                                
                                                                                                                
 * bash/lib directory - Any files that end in .bash in this directory will get   
   sourced by bashrc. The files in this directory should be standalone. They      
   should not rely on anything other files being loaded first.                   
                                                                                                                
 * bash/plugin directory - Any files that end in .bash in this directory will    
   get source by bashrc. The files in this directory will be sourced after the   
   files in the lib directory and so they can use functionality defined in the    
   lib directory.



Install
-------        
                
The install script will setup this config for the current user. It basically      
involves 2 steps:
 
 * Link bashrc to ~/.bashrc
 * Link bash directory to ~/.bash


Notes
-----

* The git-completion files in copied from the contrib directory of the git
  source code repository.
