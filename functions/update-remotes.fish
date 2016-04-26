function update-remotes --description "SSH's to each of the provided servers and runs `yum update -y`; provide `--check` as first argument to run `yum check-update` instead"
  set -l arg_count (count $argv)
  if [ $arg_count -gt 0 ]
    if [ $argv[1] = "--check" ]
      for i in (seq 2 $arg_count)
        _check-remote $argv[$i]
      end
    else
      for remote in $argv
        _update-remote $remote
      end
    end
  end
end

function _update-remote -a servername
  printf "Updating packages for %s...\n" $servername
  printf "> ssh %s yum update -y\n" $servername
  printf "--------OUTPUT:--------\n"

  ssh $servername yum update -y
end

function _check-remote -a servername
  printf "Checking %s for updates...\n" $servername
  printf "> ssh %s yum -q check-update\n" $servername

  ssh $servername yum -q check-update | _pipeset output
  if [ $output ]
    printf "--------UPDATES:--------%s\n" $output
  else
    printf "-------NO UPDATES-------\n\n"
  end
end

# See: https://github.com/fish-shell/fish-shell/issues/159
function _pipeset --no-scope-shadowing
    set -l _options
    set -l _variables
    for _item in $argv
        switch $_item
            case '-*'
                set _options $_options $_item
            case '*'
                set _variables $_variables  $_item
        end
    end
    for _variable in $_variables
        set $_variable ""
    end
    while read _line
        for _variable in $_variables
            set $_options $_variable $$_variable$_line\n
        end
    end
    return 0
end
