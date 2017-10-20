
load_colors


# See http://www.heartmindcode.com/blog/2011/03/crazy-bash-programming-with-wayne-e-seguin/

ps1_git()
{
    printf "${YELLOWF}$(__git_ps1 "(git:%s)")${COLORRESET}"
} # end ps1_git()

ps1_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        printf "${PURPLEF}[v:$(basename $VIRTUAL_ENV)]${COLORRESET} "
    fi
} # end ps1_virtualenv()

ps1_nvm() {
    type nvm > /dev/null 2>&1
    local rc=$?
    if [ "$rc" -eq 0 ]; then
        printf "${PURPLEF}[n:$(nvm version)]${COLORRESET} "

    fi
}

ps1_identity()
{
    if [[ $UID -eq 0 ]]; then
        printf "${REDF}$USER${COLORRESET}"
    else
        printf "${GREENF}$USER${COLORRESET}"
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

    PS1="\[\033[G\]\$(ps1_error)\$(ps1_virtualenv)$(ps1_identity)\$(ps1_nvm)\$(ps1_git)${separator}${prompt_char} "
} # end ps1_set()

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=auto

ps1_set --prompt "$"
