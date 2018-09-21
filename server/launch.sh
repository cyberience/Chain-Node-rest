#!/bin/bash
echo "[P1] Restart is :$1 "

echo "If restart, then need to stop the service, and re-establish a the deamon"
if [ -z "$*" ]
then
    echo "No Arguments; which is a basic restart"
else
    echo "Restarting services and killing old ones; If we have multiple Arguments, then case it here."
    forever stopall
    npm rebuild zeromq
fi

echo "Check the service is running, if not, then start it."
ps auxw | grep restnode | grep -v grep
if [ $? != 0 ]
then
    echo "Launching Rest Node Application"
    cd ./src
    BUILD_ID=dontkillme forever start -a restnode.js &&
    exit 0
fi