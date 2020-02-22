#!/bin/bash

if [ "$1" == "publish" ]; then
    git add -u
    git commit -a --allow-empty-message -m ''
    git push
    echo blog published
else
    echo "We aren't publishing"
fi