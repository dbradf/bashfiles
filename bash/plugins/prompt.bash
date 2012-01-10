
load_colors


# See http://www.heartmindcode.com/blog/2011/03/crazy-bash-programming-with-wayne-e-seguin/

ps1_git()
{
    local branch=""

    branch=`git_get_current_branch`

    if [ "$branch" != "" ]; then
        printf "${YELLOWF}(git:$branch)${COLORRESET}"
    fi
} # end ps1_git()


ps1_identity()
{
    if [[ $UID -eq 0 ]]; then
        printf "${REDF}\u${COLORRESET}"
    else
        printf "${GREENF}\u${COLORRESET}"
    fi

    printf "@${CYANF}\h${COLORRESET}:${GREENF}\w${COLORRESET} "

    return 0
} # end ps1_identity()


ps1_error()
{
    local RC=$?

    if [ $RC -ne 0 ]; then
        printf "${WHITEF}${REDB}($RC)${COLORRESET} "
    fi
} # end ps1_error()


ps1_set()
{
    local prompt_char='$'
    local separator="\n"

    if [[ $UID -eq 0 ]]; then
        prompt_char='#'
    fi

    while [[ $# -gt 0 ]]; do
        token="$1"; shift

        case "$token" in
            --trace)
                export PS4='+[${BASH_SOURCE}] : ${LINENO} : ${FUNCNAME[0]:+${FUNCNAME[0]}() $ }'
                shopt -o xtrace
                ;;

            --prompt)
                prompt_char="$1"
                shift
                ;;

            --separator)
                separator="$1"
                shift
                ;;

            *)
                true # Ignore everything else
                ;;
        esac
    done

    PS1="\$(ps1_error)$(ps1_identity) \$(ps1_git)${separator}${prompt_char} "
} # end ps1_set()


ps1_set --prompt ">"
