function fish_prompt
    set -l last_status $status

    # Top line: current location
    printf '\n'

    set_color '#8B5CF6'
    printf '󰉋 '

    set_color '#F4F4F5'
    printf '%s' (prompt_pwd)

    # Show errors without cluttering successful commands
    if test $last_status -ne 0
        printf ' '
        set_color '#F87171'
        printf '✗ %s' $last_status
    end

    # Bottom line: command indicator
    printf '\n'
    set_color '#8B5CF6'
    printf '❯ '

    set_color normal
end
