#!/usr/bin/env bash
# Thanks to koala_man, from #linux on irc.freenode.net, for this.
find . -type d | while read dir; do (cd "$dir"; mp3ogg;); done
