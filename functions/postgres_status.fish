function postgres_status --description '"running" if postgres is currently running, "not running" if it isnt'
  if which docker >/dev/null
    if docker info >/dev/null
      if docker ps | grep postgres > /dev/null
        printf "running"
        return 0
      end
      printf "not running"
      return 1
    end
    printf "not running (docker not running)"
    return 1
  end
  printf "not running (docker isnt installed)"
  return 1
end
