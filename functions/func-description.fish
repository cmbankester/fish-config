function func-description --description 'Gets the description of a function'
  printf "%s" (functions $argv[1] | head -n 1 | sed -E "s|.*'(.*)'.*|\1|")
end
