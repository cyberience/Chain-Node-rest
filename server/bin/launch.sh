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

echo "Check the serive is running, if not, then start it."
ps auxw | grep restnode | grep -v grep > /dev/null
if [ $? != 0 ]
then
    echo "Launching Rest Node Application"
    cd ./src
    forever start -a -o >(logger -t restnode.log) -e >(logger -t restnode.log) restnode.js &
fi