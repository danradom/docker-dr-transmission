#!/bin/sh
#

config="/data/transmission/conf/settings.json"


if [ ! $1 ]; then
        echo ""
        echo "usage:  $0 < list | status | delete | unpause >"
        echo ""
        exit 1
fi


case $1 in
        config)
        sudo vi $config
        ;;

        delete)
        if [ ! $2 ]; then
                echo ""
                echo "usage:  $0 delete id"
                echo ""
                exit 1
        fi
        transmission-remote -t $2 -r
        ;;

        list)
        transmission-remote -l
        ;;

        start)
        transmission-daemon --log-error --logfile /data/transmission/conf/transmission.log -g /data/transmission/conf
        ;;

        status)
        transmission-remote -st
        ;;

        stop)
        kill -9 $(ps -ef |grep transmission-daemon |grep -v grep |awk '{print $1}')
        ;;

        unpause)
        if [ ! $2 ]; then
                echo ""
                transmission-remote -l
                echo ""
                echo "usage:  $0 unpause id"
                echo ""
                exit 1
        fi
        transmission-remote -t $2 -s
        ;;

        *)
        echo ""
        echo "usage:  $0 < list | status | delete | unpause >"
        echo ""
esac
