# Add bass plugin
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'oh-my-fish/theme-default'

# Initialize fundle plugins
fundle init

set -gx PATH /usr/local/sbin $PATH

# Load desks
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

set -l newline \x0a
set -l tab \x09
set -l green_s \x1b\x5b32m
set -l green_e \x1b\x5b30m\x1b\x28B\x1b\x5bm

if which docker-machine >/dev/null
  set -l docker_machine_status (docker-machine status vmware-fusion)
  if [ $docker_machine_status = "Running" ]
    eval (docker-machine env vmware-fusion)
    set fish_greeting "Docker Machine and Docker are ready to use"
  else
    set fish_greeting "Docker machine status:$tab$docker_machine_status"$newline"Type$green_s docker-machine start vmware-fusion; and eval (docker-machine env vmware-fusion)$green_e to start"
  end
else
  set fish_greeting "Docker Machine is not installed"
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function fish_right_prompt
    echo (date "+%m/%d/%y %H:%M:%S")" | "(set -q DESK_NAME; and echo $DESK_NAME; or echo no active desk)
end
