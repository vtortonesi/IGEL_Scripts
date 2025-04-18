#!/bin/bash

# Get user input using Zenity
user_input=$(zenity --entry --title="Enter Device Name" --text="Please enter your business unit and sitecode:")

# Check if the user input is empty
if [ -z "$user_input" ]; then
    echo "No input provided. Exiting."
    exit 1
fi

# Get the device serial number
serial_number=$(dmidecode -s system-serial-number | tail -c6)

#Get the device type (laptop, desktop, etc.)
chassis=$(hostnamectl chassis | cut -c1)

# Concatenate the user input with the last five characters of the serial number
new_hostname="${user_input}${chassis}${serial_number}"

#Update the network.dns.hostname file and update settings with killwait
#Uncomment pkexec if using this as a Custom Application as the Custom Application runs in the context of a standard user
#pkexec su -c 

setparam network.dns.hostname "$new_hostname" && killwait_postsetupd && write_rmsettings 


# Notify the user of the update
zenity --info --title="Update Complete" --text="The hostname has been updated to: $new_hostname. Restarting"

#Restart
/usr/bin/igel_reboot_required
