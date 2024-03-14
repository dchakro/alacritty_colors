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

# # Get yj from: https://github.com/sclevine/yj

# shopt -s globstar
cd themes
if command -v yj > /dev/null 2>&1; then
	# For each .yaml file in the current directory
	for yaml_file in *.yml; do
	    # Use basename to get the file name without the .yaml extension
	    base_name=$(basename "$yaml_file" .yml)

	    # Convert .yaml to .toml using yj
	    cat "$yaml_file" | yj -yt > "${base_name}.toml"
	done
else
	echo "Get yj from: https://github.com/sclevine/yj"
fi

