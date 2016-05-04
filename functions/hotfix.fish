# Usage: `hotfix bug-name`
function hotfix -a hotfixname
  git checkout master; and git checkout -b hotfix/$hotfixname
end
