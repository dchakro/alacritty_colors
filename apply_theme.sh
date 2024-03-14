#!/usr/bin/env bash

# #<---------------------------->
# # You must include this section when:
# # Distributing, Using and/or Modifying this code.
# # Please read and abide by the terms of the included LICENSE.
# # Copyright 2020, Deepankar Chakroborty, All rights reserved.
# #  
# #  Version : 0.1
# #  Author : Deepankar Chakroborty (https://github.com/dchakro)
# #  Report issues: https://github.com/dchakro/alacritty_colors/issues
# #  License: https://github.com/dchakro/alacritty_colors/blob/master/LICENSE
# #<---------------------------->

# Set the directory where this is installed:
BASEDIR="${HOME}/scripts/alacritty_colors"
cd ${BASEDIR}

# Make a list of themes
declare -a arrFiles
cd themes
for file in *.toml
do
    arrFiles=("${arrFiles[@]}" "$file")
done
cd ..


RESET()
{
# Copies ./base.toml -> ~/.alacritty.toml
echo ""
echo 'This will overwrite your ~/.alacritty.toml with ./base.toml'
while true; do
		read -p "Restore base config (y/N): " backup_choice1
		case $backup_choice1 in
	       	[Yy]* )  
	       		cp ./base.toml ~/.alacritty.toml && echo "Config reset to base!"
	       		break 
	       		;;
	       	[Nn]* )  
	       		echo "Reset aborted."
	       		break
	       		;;
	       	* )
	       		echo "Please answer with either Y/y or N/n."
	   	esac
	done

}

BACKUP()
{
# Backs up ~/.alacritty.toml as ~/.alacritty.bak.toml
if [ ! -f ~/.alacritty.toml ] ; then
	echo '~/.alacritty.toml does not exist!'
	RESET
fi

if [ ! -f ~/.alacritty.bak.toml ] ; then
	cp ~/.alacritty.toml ~/.alacritty.bak.toml && echo "Config backup successful!"
else
	while true; do
		read -p "Backup exists. Overwrite? (y/N): " backup_choice2
	    case $backup_choice2 in
	       	[Yy]* )  
	       		cp ~/.alacritty.toml ~/.alacritty.bak.toml && echo "Backup overwrite successful!"
	       		break 
	       		;;
	       	[Nn]* )  
	       		echo "Backup aborted."
	       		break
	       		;;
	       	* )
	       		echo "Please answer with either Y/y or N/n."
	   	esac
	done
fi
}

RESTORE()
{
if [ -f ~/.alacritty.bak.toml ] ; then
   cp -f ~/.alacritty.bak.toml ~/.alacritty.toml && echo "Config restored!"   
else
	echo "Backup config for alacritty does not exist!!"
	exit 1
fi
}


LIST_THEMES()
{
echo 'Availabe themes:'
declare -i counter
counter=1
for item in "${arrFiles[@]}"
do
    echo "# ${counter} :${item}"
    counter=($counter+1)
done
}

APPLY_THEMES()
{
LIST_THEMES
read -p "Choose (default=1): " inp
if [ -z "${inp}" ]; then
	inp=1
fi
inp=$((inp-1)) # as array indices start from 0
echo ""
echo "Applying the theme: ${arrFiles[inp]}"

cat ./base.toml ./themes/${arrFiles[inp]} >| ~/.alacritty.toml
bash ./show_colors.sh

while true; do
	read -p "Keep changes (Y/n): " choice
	case $choice in
	   	[Yy]* )  
	   		echo "Theme set to: ${arrFiles[inp]}"
	   		exit 0 
     		;;
       	[Nn]* )  
       		RESTORE
       		break
       		;;
       	* )
       		echo "Please answer with either Y/y or N/n."
	   	esac
done
}

while true
do
	reset_choice=""
	choice=""
	backup_choice1=""
	backup_choice2=""
	inp=""
	
	
	printf ' -- Apply alacritty themes -- 
	1) Apply Themes
	2) Backup .alacritty.toml
	3) Restore the backup
	4) Reset config (no defined color scheme)
	5) Exit
	  
	Enter: ';
	read var;
	
	if [ "$var" -eq "1" ]; then
		APPLY_THEMES
	fi
	if [ "$var" -eq "2" ]; then
		BACKUP
		exit 0
	fi
	if [ "$var" -eq "3" ]; then
		RESTORE
		exit 0
	fi
	if [ "$var" -eq "4" ]; then
		RESET
		exit 0
	fi
	if [ "$var" -eq "5" ]; then
		exit 0
	fi
done