#!/bin/sh
#
# transmission script
#


kill -9 $(ps -ef |grep transmission-daemon |grep -v grep |awk '{print $1}')
