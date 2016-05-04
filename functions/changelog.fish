# Usage: `changelog 0.0.1 0.0.2` or `changelog 9e1a1cecc270bed06c98c5d90928df341e0478d6 98ffc20a4a673587b87a48d5ee14b4e1acd21b82`
function changelog -a from to --description "Prints the commits between `from` and `to` formatted as a changelog"
  set -l tab \x09
  set -l newline \x0a
  set -l project_repo (git config --get remote.origin.url | cut -d':' -f 2 | cut -d'.' -f 1)
  if test -z $from
    printf 'Usage: changelog start_tag [end_tag]\n'
    printf 'E.g.: changelog v0.0.1 v0.0.1\n'
  else if test -z $to
    printf '## %s -> %s\n*%s*\n\n' "$from" (git show -s --format="%H") (git show -s --format="%cd")
    printf "%s\n" (git log $from... --pretty=format:"* %s%n$tab* __[view commit](http://gitlab.immense.net/$project_repo/commit/%H)__%n%n" --no-merges)
  else
    printf '## %s -> %s\n*%s*\n\n' "$from" "$to" (git show -s --format="%cd" $to^0)
    printf "%s\n" (git log $from...$to --pretty=format:"* %s%n$tab* __[view commit](http://gitlab.immense.net/$project_repo/commit/%H)__%n%n" --no-merges)
  end
end
