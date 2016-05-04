# Usage: `feature feature-name`
function feature -a featurename
  git checkout master; and git checkout -b feature/$featurename
end
