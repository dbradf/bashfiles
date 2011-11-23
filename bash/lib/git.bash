

git_get_current_branch()
{
    local line=""

    if ! command -v git >/dev/null 2>&1; then
        return 1
    fi

    while read -r line
    do
        case "${line}" in 
            [[=*=]][[:space:]]*)
                branch="${line/[[=*=]][[:space:]]}"
                ;;
        esac
    done < <(git branch 2>/dev/null)

    echo $branch
    return 0
} # end git_get_current_branch()
