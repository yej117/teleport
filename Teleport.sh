#!/bin/bash
# A simple shell scripts for teleporting to some frequently visit directories
# Please revise the section "locations"

#################
### Locations ###
#################
: '
Paths and their corresponding names (for display purpose only)
Format (same for nicknames): 
locations=("path1" "path2" "path3")
 or 
locations=(
"path1"
"path2"
"path3"
)
'

locations=(
"~/"
)

nicknames=(
"sweet home"
)

#################
### Help page ###
#################
helpFunction()
{
    echo "This script is used for teleporting to different directories."
    echo -e "Please source the file to execute the mission.\n"
    echo "Usage: . Teleport.sh"
    exit 0 # Exit script after printing help
}

while getopts "h" opt
do  
    case "$opt" in
        h ) helpFunction;;
        \? ) helpFunction;; # Print helpFunction in case parameter is non-existent
    esac
done

#############
### Main ####
#############
echo "Let's teleport to different location!"
for inx in "${!locations[@]}"
do
    echo -e "$inx | ${nicknames[$inx]}\n   ${locations[$inx]}\n"
done

read -p "Where are you going? " wo

not_travel=True
if [ ! -z $wo ]; then
    for inx in "${!locations[@]}"; do 
        if [ $wo == $inx ]; then
            cd ${locations[$inx]}
            not_travel=False
        fi
    done
fi

if [ $not_travel == True ]; then 
    echo "See you in the next journey ;-)"
fi