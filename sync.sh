#!/usr/bin/env bash

rsync -av --delete _site/* gousiosg@192.168.1.166:~/gousios.gr/ || exit 1
