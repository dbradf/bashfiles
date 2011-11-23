
load_colors()
{
    local esc=""

    # Foreground colors
    BLACKF="${esc}[30m"
    REDF="${esc}[31m"
    GREENF="${esc}[32m"
    YELLOWF="${esc}[33m"
    BLUEF="${esc}[34m"
    PURPLEF="${esc}[35m"
    CYANF="${esc}[36m"
    WHITEF="${esc}[37m"

    # Background colors
    BLACKB="${esc}[40m"
    REDB="${esc}[41m"
    GREENB="${esc}[42m"
    YELLOWB="${esc}[43m"
    BLUEB="${esc}[44m"
    PURPLEB="${esc}[45m"
    CYANB="${esc}[46m"
    WHITEB="${esc}[47m"

    COLORRESET="${esc}[0m"
} # end load_colors()
