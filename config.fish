# Add bass plugin
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'oh-my-fish/theme-default'

# Initialize fundle plugins
fundle init

set -gx PATH /usr/local/sbin $PATH

test -e (dirname (status -f))/config.local.fish; and source (dirname (status -f))/config.local.fish

# Load desks
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

nvm use default >/dev/null

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function fish_right_prompt
    echo (date "+%m/%d/%y %H:%M:%S")" | "(set -q DESK_NAME; and echo $DESK_NAME; or echo no active desk)
end
