#!/bin/bash

#Skeleton Menu
#This is an empty example with instruction for customizing a bash script that has a menu.


me="$(whoami)"
options[0]="Some Option"
options[1]="Another Option"
options[2]="Yet Another Option"
options[3]="Option"
options[4]="Option"
options[5]="I think you get it"
options[6]="Another Option"

#Actions to take based on selection
function ACTIONS {
    if [[ ${choices[0]} ]]; then
    # Replace line with a command
    # And another command
    # Yes, that includes the '#'

# The bellow 'function work-list' is used to tell the user what's happening, as it is ran.    
function work-list () {
# 'echo' will print what's between the "" *
echo "# Description of first command"
#this is at '5'% (not really accurate, but an aproximation **
echo "5%"
#the next line is the acutual command: ***
#it's an example command, taken from a previous project, the ' || true' part will skip printing errors in terminal or whichever command they follow. the ' $me' bit is a variable that fetches the users username for launching commands.
mkdir /home/$me/Desktop/iBackup || true 

#and repeat; print description of command, *
echo "some words"
#and indicate progress with an increase in percentage: **
echo "27%"
#and execute a command: ***
sudo apt update || true

#same*
echo "some description"
#same, again**
echo "100%"
#you get it ***
sudo apt update || true


}

work-list | zenity --progress --title "This is a Zenity window" --auto-close

exit 0
    fi
    if [[ ${choices[1]} ]]; then
        #***
	sudo apt update || true
	# print instructions to user with zenity calls (just use echo or printf if zenity isn't available.
	zenity --info --width 300 --text "Another Zenity Window"
	#*
	sudo apt update
	#*
	sudo apt update
    fi
    if [[ ${choices[2]} ]]; then
	#description of command
	# actual command 'sudo apt update is an example, replace with the commands your script actually calls for.
	sudo apt update
    fi
    if [[ ${choices[3]} ]]; then
    	#description of command
	# actual command
	sudo apt update
    fi
    if [[ ${choices[4]} ]]; then
       #description of command
       # actual command
       sudo apt update
    fi
    if [[ ${choices[5]} ]]; then
        #description of command
	# actual command
	sudo apt update
    fi 
    if [[ ${choices[6]} ]]; then
	#print 'bye', or equivalant, than exit
	echo "Tchuss!"
	exit
    fi
}

#Variables 
ERROR= ""

#Clear screen for menu
clear

#Menu function
function MENU {
    echo "Skeleton Menu"
    for NUM in ${!options[@]}; do
        echo "[""${choices[NUM]:- }""]" $(( NUM+1 ))") ${options[NUM]}"
    done
    echo "$ERROR"
}

#Menu loop (idk what to do with this bit honestly x.x"...)
while MENU && read -e -p "Please make a choice.. " -n1 SELECTION && [[ -n "$SELECTION" ]]; do
    clear
    if [[ "$SELECTION" == *[[:digit:]]* && $SELECTION -ge 1 && $SELECTION -le ${#options[@]} ]]; then
        (( SELECTION-- ))
        if [[ "${choices[SELECTION]}" == "+" ]]; then
            choices[SELECTION]=""
        else
            choices[SELECTION]="+"
        fi
            ERROR=" "
    else
        ERROR="Invalid option: $SELECTION"
    fi
done

ACTIONS
