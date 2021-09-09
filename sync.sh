#!/usr/bin/env bash

rake || exit 1
bundle exec jekyll build  || exit 1
rsync -av --delete _site/* gousiosg@www.gousios.gr:~/gousios.gr/ || exit 1
