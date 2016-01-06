function postgres_status --description '"running" if postgres is currently running, "not running" if it isnt'
  if which docker-machine >/dev/null
    if [ (docker-machine status vmware-fusion) = "Running" ]
      if docker ps | grep postgres > /dev/null
        printf "running"
        return 0
      end
    end
    printf "not running"
    return 1
  end
  printf "not running (docker-machine doesn't exist)"
  return 1
end
