#!/bin/sh
#
# container stop script
#

container="dr-tr"

docker stop $container > /dev/null 2>&1

id=$(docker ps |grep $container |grep -v grep |awk '{print $1}')

if [ -z "$id" ]; then
        echo ""
        echo "$container container stopped"
        echo ""
fi
