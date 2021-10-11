#!/bin/bash
author_name="# Mehedi Hasan"
version="# 1.0"
modified="# Modified_11102021_10_00PM";

#Variable declaration
LOGFILE="/usr/src/jar_update.log"
jar_location="/tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM"
signaling_loc="/usr/local/iTelSwitchPlusSignalingIM"
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

function jar_change(){
	echo -e " ## $(Green) Signaling jar upadting.........\\033[0;32m#"
	cd $signaling_loc
	mv TelSwitchPlusSignaling.jar iTelSwitchPlusSignaling.jar_$current_time
	mv $jar_location/TelSwitchPlusSignaling.jar .
	echo -e "## ${Green} Signaling jar updated susccessfully   \033[0;32m"
signaling_start
}

function signaling_start(){
		cd $signaling_loc
		`sh runiTelSwitchPlusSignaling.sh > /dev/null 2>&1`
		 sleep 60
signaling_statuscheck		 
}

function signaling_statuscheck(){
signaling_staus=$(cat $signaling_loc/iTelSwitchPlusSignaling.log  | grep "started successfully")
	if [ -z $signaling_staus ]; then
	echo "### ${BGreen} Switch Signaling started successfully ..\033[1;31m"
		else 
		echo "### ${BRed} Faled to start switch ..\033[1;31m"
		
	fi
}

function stop_switch(){
		echo -e " ## ${Red}Switch Signaling going to stop...   \033[0;32m#"
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
		    `kill -9 $process_id > /dev/null/ 2>&1`
			 echo " ## {Red} Switch stopped Succesfully.....\\033[0;32m#"
		     fi
		 fi
jar_change
}
stop_switch