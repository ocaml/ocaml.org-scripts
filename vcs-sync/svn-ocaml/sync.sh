#!/bin/sh -ex
# Synchronize the branches from INRIA SVN to Github.
# Tags are converted into native git tags

cd ocaml

git svn fetch -A ../authors.txt --all || exit $?

for branch in `git branch -r | grep '^  svn/' | grep -v '^  svn/tags'`;
do
    name=`echo "$branch" | awk -F '/' '{print $2}'`
    git branch -f --track "$name" "remotes/$branch" || exit $?
done

for tag in `git branch -r | grep '^  svn/tags'`;
do
    name=`echo "$tag" | awk -F '/' '{print $3}'`
    git tag -f "$name" "$tag" || exit $?
done

git repack -A -d || exit $?
git gc || exit $?

git push github --all || exit $?
git push github --tags
