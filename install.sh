#!/bin/bash

# Check for command line args.
if [ "$1" = "" ]; then
    EMACS_DIR="$HOME/.emacs.d"
else
    EMACS_DIR="$1"
fi


MODES="org-mode latex-mode"

for MODE in $MODES; do
    DIR="$EMACS_DIR/snippets/$MODE"
    if [ ! -d "$DIR" ]; then
	    mkdir "$DIR"
    fi

    find snippets/ -type f | while read file; do
        ABSPATH=$(readlink -f "$file")
        ln -s "$ABSPATH" "$DIR/"
    done
done
