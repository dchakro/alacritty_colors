#!/usr/bin/env bash

# #<---------------------------->
# # You must include this section when:
# # Distributing, Using and/or Modifying this code.
# # Please read and abide by the terms of the included LICENSE.
# # Copyright 2020, Deepankar Chakroborty, All rights reserved.
# #  
# #  Version : 0.0.1
# #  Author : Deepankar Chakroborty (https://github.com/dchakro)
# #  Report issues: https://github.com/dchakro/alacritty_colors/issues
# #  License: https://github.com/dchakro/alacritty_colors/blob/master/LICENSE
# #<---------------------------->

# Make a theme list

declare -a arrFiles
cd themes
for file in *.yml
do
    arrFiles=("${arrFiles[@]}" "$file")
done
cd ..


RESET()
{
# Copies ./base.yml -> ~/.alacritty.yml
echo ""
echo 'This will overwrite your ~/.alacritty.yml with ./base.yml'
while true; do
		read -p "Restore base config (y/N): " backup_choice1
		case $backup_choice1 in
	       	[Yy]* )  
	       		cp ./base.yml ~/.alacritty.yml && echo "Config reset to base!"
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
# Backs up ~/.alacritty.yml as ~/.alacritty.bak.yml
if [ ! -f ~/.alacritty.yml ] ; then
	echo '~/.alacritty.yml does not exist!'
	RESET
fi

if [ ! -f ~/.alacritty.bak.yml ] ; then
	cp ~/.alacritty.yml ~/.alacritty.bak.yml && echo "Config backup successful!"
else
	while true; do
		read -p "Backup exists. Overwrite? (y/N): " backup_choice2
	    case $backup_choice2 in
	       	[Yy]* )  
	       		cp ~/.alacritty.yml ~/.alacritty.bak.yml && echo "Backup overwrite successful!"
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
if [ -f ~/.alacritty.bak.yml ] ; then
   cp -f ~/.alacritty.bak.yml ~/.alacritty.yml && echo "Config restored!"   
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

cat ./base.yml ./themes/${arrFiles[inp]} >| ~/.alacritty.yml
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
	2) Backup .alacritty.yml
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