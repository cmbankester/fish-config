function update-local --description 'Updates brew, upgrades atom packages'
  _brewup; and _apmup
end

function _apmup --description 'Upgrades atom packages'
  printf "> apm upgrade --confirm false\n"; and \
  apm upgrade --confirm false; or \
  _printfail "apm upgrade failed..."
end

function _brewup --description 'Updates brew remote and upgrades any packages marked for update'
  printf "> brew update\n"; and \
  brew update; and \
  printf "> brew upgrade\n"; and \
  brew upgrade; and \
  printf "> brew prune\n"; and \
  brew prune; or \
  _printfail "Brew update failed..."
end

function _printfail
  printf "%s" "$argv"; and return 1
end
