#!/bin/bash
author_name="# Mehedi Hasan"
version="# 1.0"
modified="# Modified_11102021_10_00PM";

#Variable declaration
LOGFILE="/usr/src/jar_update.log"
jar_location="/home/workspace/Project_switchJar_Update"
signaling_loc="/usr/local/iTelSwitchPlusSignalingwintersoldier705"
current_time=$(date '+%Y-%m-%d_%H:%M:%S')

#No Colors
			NC='\033[0m'              # Text Reset/No Color
# Regular Colors
			Black='\033[0;100m'       # Black
			Red='\033[0;31m'          # Red
			Green='\033[0;32m'        # Green
			# Bold
			BBlack='\033[1;100m'      # Black
			BRed='\033[1;31m'         # Red
			BGreen='\033[1;32m'       # Green



function signaling_statuscheck(){
signaling_staus=$(cat $signaling_loc/iTelSwitchPlusSignaling.log  | grep -w "started successfully")
	if [ ! -z "{$signaling_staus}" ]; then
	    echo "### ${BGreen} Switch Signaling started successfully ..\033[1;31m";
	else 
		echo "### ${BRed} Faled to start switch ..\033[1;31m";
		
	fi
}


function signaling_start(){
		cd $signaling_loc
		`service  iTelSwitchPlusSignalingwintersoldier705 start` > /dev/null 2>&1`
		 sleep 60
signaling_statuscheck		 
}


function jar_change(){
	echo -e "## ${Green} Signaling jar upadting.........\\033[0;32m#"
	cd $signaling_loc
	mv iTelSwitchPlusSignaling.jar iTelSwitchPlusSignaling.jar_$current_time
	mv $jar_location/iTelSwitchPlusSignaling.jar .
	echo -e "## ${Green} Signaling jar updated susccessfully   \033[0;32m";
signaling_start
}


function stop_switch(){
		echo -e " ## ${Red}Switch Signaling going to stop...   \033[0;32m#";
		cd $signaling_loc
		`sh shutdowniTelSwitchPlusSignaling.sh > /dev/null 2>&1`
		 sleep 1
		`sh shutdowniTelSwitchPlusSignaling.sh > /dev/null 2>&1`
		 sleep 1
		`sh shutdowniTelSwitchPlusSignaling.sh > /dev/null 2>&1`
		 sleep 1
		`rm -rf iTelSwitchPlusSignaling.log`
		 switch_procces_id=$(/bin/ps -fu $USER| grep "iTelSwitchPlusSignaling.jar wintersoldier705" | grep -v "grep" | gawk  '{print $2}')
		 if [ -z $switch_procces_id ];then
		 echo "Switch stopped Succesfully....."
		     if [ ! -z $switch_procces_id ];then
		    `kill -9 $process_id > /dev/null 2>&1`
			 echo -e " ## {Red} Switch stopped Succesfully.....\\033[0;32m#";
		     fi
		 fi
jar_change
}
stop_switch