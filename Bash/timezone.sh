#!/bin/bash

#Declare Variables
#check for run once value 
#uncomment the run once - line 7 and pkexec su -c touch FILE to enable a run-once action - line 22

# FILE="/wfs/run-once"

#if [ -f "$FILE" ]; then
#	exit
#fi

keyvalue=($(zenity --width=500 --height=300 --title "Select Your Time Zone" --list --column="Location" --column="Time Zone Name" "Chicago" "Central" "New_York" "Eastern" "Denver" "Mountain" "Los_Angeles" "Pacific"))

if [[ $? == 1 ]]; then
exit

	else

		pkexec su -c "setparam system.remotemanager.ums_structure_tag $keyvalue"
		pkexec su -c "setparam system.time.timezone.america $keyvalue; killall postsetupd; write_rmsettings"
		#pkexec su -c "touch $FILE"
		/usr/bin/igel_reboot_required
	exit

fi

