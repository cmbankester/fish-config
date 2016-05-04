# Usage: `release 0.0.1`

function release -a tag
  set -l current_branch (git rev-parse --abbrev-ref HEAD)
  if test -z $tag
    printf 'Usage: release {tag}\n'
    printf 'E.g.: release 0.0.1\n'
  else
    if test -n (git show-ref refs/heads/releases/$tag)
      git checkout releases/$tag
    else
      git checkout -b releases/$tag
    end
    printf "Now run: 'git merge --no-ff %s'" $current_branch
  end
end
