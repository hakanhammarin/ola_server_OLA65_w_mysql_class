#!/usr/bin/env sh

DIRECTORY=`dirname $0`
cd $DIRECTORY
exec ./bin/OLA-Klient "$@"