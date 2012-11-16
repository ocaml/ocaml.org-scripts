#!/bin/sh
# Initialise a fresh repository that fetches the INRIA SVN
# and turns it into a git repository.

git svn clone --prefix=svn/ --branches version --branches branches --tags release --trunk trunk http://caml.inria.fr/svn/ocaml
cd ocaml
git remote add github git@github.com:ocaml/ocaml
