function brewup --description 'Updates brew remote and upgrades any packages marked for update'
  printf "> brew update\n"; and \
  brew update; and \
  printf "> brew upgrade\n"; and \
  brew upgrade; and \
  printf "> brew prune\n"; and \
  brew prune; or \
  printf "Failed somewhere..."
end
