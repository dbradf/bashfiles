
load_colors

ps1_git()
{
    local branch=""

    branch=`git_get_current_branch`

    if [ "$branch" != "" ]; then
        printf "(git:$branch)"
    fi
} # end ps1_git()


ps1_error()
{
    local RC=$?

    if [ $RC -ne 0 ]; then
        printf "($RC) "
    fi
} # end ps1_error()


ps1_set()
{
    PS1="${REDF}\$(ps1_error)${CYANF}[\h] ${GREENF}\w ${YELLOWF}\$(ps1_git)${COLORRESET}\n${CYANF}\$${COLORRESET} "
} # end ps1_set()

ps1_set
