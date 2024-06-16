#!/usr/bin/env bash

# #<---------------------------->
# # You must include this section when:
# # Distributing, Using and/or Modifying this code.
# # Please read and abide by the terms of the included LICENSE.
# # Copyright 2024, Deepankar Chakroborty, All rights reserved.
# #
# #  Version : 0.3
# #  Author : Deepankar Chakroborty (https://github.com/dchakro)
# #  Report issues: https://github.com/dchakro/alacritty_colors/issues
# #  License: https://github.com/dchakro/alacritty_colors/blob/master/LICENSE
# #<---------------------------->

# # Get yj from: https://github.com/sclevine/yj

# shopt -s globstar
HELP()
{
printf 'This script allows you to covnert YAML formatted themes to TOML while changing some keywords 
to ensure compatibility with contemporary release of alacritty.

Usage:
   bash convert_to_toml.sh [options]

OPTIONS:     
    --help        		Show help
    --dir    	   		Batch convert all files stored in themes/
    --file FILE.yaml	Convert input file
';
}


convertDir(){
	cd themes
	if command -v sd > /dev/null 2>&1; then
		if command -v yj > /dev/null 2>&1; then
			if /bin/ls | grep -Ei "yml$" &> /dev/null ; then
				# For each .yaml file in the current directory
				for yaml_file in *.yml; do
					# Use basename to get the file name without the .yaml extension
					base_name=$(basename "$yaml_file" .yml)

					# Convert .yaml to .toml using yj
					cat "$yaml_file" | yj -yt | sd "^.*_background.*\r?\n" "" | sd "^.*_foreground.*\r?\n" "" > "${base_name}.toml"
				done
			else
				echo "No YAML files found in ./themes/"
			fi
		else
			echo "Get yj from: https://github.com/sclevine/yj"
		fi
	else
		echo "Get sd from: https://github.com/chmln/sd"
	fi
}

convertFile(){
	# checking for dependencies
	if command -v sd > /dev/null 2>&1; then
		if command -v yj > /dev/null 2>&1; then
			yaml_file=${1}
			# Use basename to get the file name without the .yaml extension
			base_name=$(basename "$yaml_file" .yml)
			# Convert .yaml to .toml using yj
			cat "${yaml_file}" | yj -yt | sd "^.*_background.*\r?\n" "" | sd "^.*_foreground.*\r?\n" "" > "${base_name}.toml"	
		else
			echo "Get yj from: https://github.com/sclevine/yj"
		fi
	else
		echo "Get sd from: https://github.com/chmln/sd"
	fi
}


if [ "$1" == "--help" ]; then
	HELP
	exit 0;
elif [ "$1" == "--dir" ]; then
	convertDir
	exit 0;
elif [ "$1" == "--file" ]; then
	convertFile $2
	exit 0;
else
    HELP
    exit 0;
fi