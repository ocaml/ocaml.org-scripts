#!/bin/sh
# Initialise a fresh repository that fetches the INRIA SVN
# and turns it into a git repository.

REPOS='ocaml ocamldoc'

for repo in $REPOS; do
    git svn clone -A authors.txt --preserve-empty-dirs --prefix=svn/ --branches version --branches branches --tags release --trunk trunk http://caml.inria.fr/svn/$repo
    ( cd $repo && git remote add github git@github.com:ocaml/$repo )
done
