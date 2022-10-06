#!/usr/bin/env bash

rake || exit 1
bundle exec jekyll build  || exit 1
rsync -av --delete _site/* gousiosg@192.168.2.67:~/gousios.gr/ || exit 1
