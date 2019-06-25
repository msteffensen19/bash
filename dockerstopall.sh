#!/bin/sh
# DOCKERSTOPALL
# Stop all running containers except autopass and portainer.io

RED='\033[0;31m'
NC='\033[0m'
EXCLUDE='sed s/autopass// | sed s/portainer.io// | sed s/aos_main// | sed a/aos_accountservice//'
CMD="docker ps -format {{.Names}} | ${EXCLUDE} | xargs"

echo "---DOCKERSTOPALL.SH---"
echo "---Stopping all running containers except autopass and portainer.io ..."
running=`docker ps --format {{.Names}} | sed s/autopass// | sed s/portainer.io// | xargs`
echo -e "---These containers will be stopped: " ${RED}$running${NC}

count=`echo $running | wc -w`

if [ $count -eq 0 ]; then
    echo "---No other containers to stop."
else
    read -p "---Stop these containers? (y/n)" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
	echo "---Stopped these containers:"
        docker stop $running
    fi
fi

echo "---These containers are still running:"
docker ps --format {{.Names}}

