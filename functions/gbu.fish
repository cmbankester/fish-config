function gbu --description "Creates a new branch with the specified name and pushes it to origin"
  set -l arg_count (count $argv)
  [ $arg_count -gt 0 ]; or return 1
  set -l branch $argv[1]
  [ $arg_count -gt 1 ]; and set -l remote $argv[2]; or set -l remote origin
  git checkout -b $branch; and git push -u $remote $branch
end
