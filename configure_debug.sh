git branch > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Make sure you run ./configure.sh from a working Git repository root"
  exit 1
fi
branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/\* //'`
echo "Applying branch ${branch} to subscribe/Running.yaml and subscribe/Hibernating.yaml"
sed -i "" "s|git-branch: .*$|git-branch: ${branch}|" subscribe/Running.yaml
