function nginx_status --description '"running" if nginx is currently running, "not running" if it isnt'
  if [ -f /usr/local/var/run/nginx.pid ]
    printf "running"
    return 0
  end
  printf "not running"
  return 1
end
