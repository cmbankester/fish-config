function print_dirs -d 'Prints the directories in the current directory'
  set -l arg_count (count $argv)
  set -l directories "./"
  set -l prefix ""
  set -l suffix \n
  set -l used_next_var false
  if [ $arg_count -gt 0 ]
    for i in (seq 1 $arg_count)
      [ $used_next_var = true ]; and set used_next_var false; and continue
      switch $argv[$i]
        case -r --recurse
          if [ $i -lt $arg_count ]
            set directories $argv[(math $i + 1)]/ $directories
            set used_next_var true
          end
        case -p --prefix
          if [ $i -lt $arg_count ]
            set prefix $argv[(math $i + 1)]
            set used_next_var true
          end
        case -s --suffix
          if [ $i -lt $arg_count ]
            set suffix $argv[(math $i + 1)]
            set used_next_var true
          end
      end
    end
  end

  for dir in $directories
    [ $dir = "./" ]; and set -l pref ""; or set -l pref $dir
    for subdir in (ls -1p (pwd)/$dir)
      if not contains $subdir $directories
        printf "%s./%s%s" $prefix $pref$subdir $suffix
      end
    end
  end
end

complete -c print_dirs -s p -l prefix -d 'Use the given prefix [default: ""]'
complete -c print_dirs -s s -l suffix -d "Use the given suffix [default: \n]"
complete -c print_dirs -s r -l recurse -d "Print directories inside the given directory"
