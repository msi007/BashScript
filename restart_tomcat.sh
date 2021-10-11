#!/bin/bash
function restart_tomcat(){
        process_id=$(/bin/ps -fu $USER| grep "jakarta-tomcat-7.0.61" | grep -v "grep" | awk '{print $2}')
        jak_loc="/usr/local/jakarta-tomcat-7.0.61/"
        if [ -z $process_id ];then
                process_id=`pgrep -f "jakarta-tomcat-7.0.61"`
        fi
        if [ ! -z $process_id ];then
                if [ $process_id -gt 0 ];then
                        service tomcat stop > /dev/null 2>&1
                        sleep 3
                        `kill -9 $process_id > /dev/null 2>&1`
                        `pkill -f "jakarta-tomcat-7.0.61" > /dev/null 2>&1`
                        `rm -rf "$jak_loc/work/Catalina" > /dev/null 2>&1`
                fi
        fi



    
		service tomcat start
		echo "Tomcat Restarted ...."
}

restart_tomcat