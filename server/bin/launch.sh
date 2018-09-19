#!/bin/bash
echo "[P1] Restart is :$1 "

echo "If restart, then need to stop the service, and re-establish a the deamon"
if [ $1 -eq 1 ]
then
        echo "Restarting services and killing old ones"
        forever stopall
        npm rebuild zeromq
        cd ./src
        forever start -a -o >(logger -t noderest.log) -e >(logger -t noderest.log) index.js &&
fi

ps auxw | grep aen.server | grep -v grep > /dev/null
#if [ $? != 0 ]
#then
#        echo "Launching Chain Node"
#         rm -f ../data/file.lock
#         ./aen.server ../ 2>&1 | logger
#fi