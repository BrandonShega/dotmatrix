#!/usr/bin/env bash
set -e

dir=$PWD
files=

manualfile="$dir/FILES"

if [ -f $manualfile ]; then
  files="$(cat $manualfile)"
else
  # Get list of files to link
  includes=".vim .zsh .mutt .git_template .config .spacemacs.d .doom.d .emacs.d
  .SpaceVim.d BrewFile"
  excludes=".gitignore"
  base="$(find -L . -maxdepth 1 -name '.*' -not -name '*.swp' -type f | sed 's#^\./##' | grep -vF $excludes)" files="$base $includes"
fi

echo $files
