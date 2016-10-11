# Load config.local.fish before anything
# Set in config.local.fish:
## REMOTE_SERVERS
## HOMEBREW_GITHUB_API_TOKEN
test -e (dirname (status -f))/config.local.fish; and source (dirname (status -f))/config.local.fish

set -gx PATH /usr/local/sbin $PATH

# Load desks
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

nvm use default >/dev/null

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function fish_right_prompt
  printf (
    set_color --bold
    printf (date "+%m/%d/%y %H:%M:%S")
    set_color normal
    printf " | "
    set_color --bold 0f0
    set -q DESK_NAME
    and printf $DESK_NAME" ◲ "
    or printf no active desk
    set_color normal
  )
end
