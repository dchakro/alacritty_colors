[![alacritty rocks](https://img.shields.io/badge/alacritty-ROCKS-blueviolet.svg)](https://github.com/alacritty/alacritty) [![GitHub license](https://img.shields.io/github/license/dchakro/alacritty_colors?color=Blue)](https://github.com/dchakro/alacritty_colors/blob/master/LICENSE) [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/dchakro/alacritty_colors/master.svg)](https://github.com/dchakro/alacritty_colors/commits/master) [![GitHub stars](https://img.shields.io/github/stars/dchakro/alacritty_colors)](https://github.com/dchakro/alacritty_colors/stargazers) [![GitHub issues](https://img.shields.io/github/issues/dchakro/alacritty_colors.svg)](https://github.com/dchakro/alacritty_colors/issues) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/dchakro/alacritty_colors/pulls)

# alacritty colors

## About
This repo contains snippets for color schemes to use with [alacritty](https://github.com/alacritty/alacritty) terminal emulator (and other similar apps) and bash scripts to [apply themes](./apply_themes.sh) and [show the current theme's colors](./show_colors.sh). 

## Demo

Here is a quick demo of the process of applying themes to alacritty.

![demo.gif](assets/demo.gif)

## How to use

1. Clone the repo and give execute permissions to included scripts.

	```shell
	# Latest version
	git clone --depth 1 https://github.com/dchakro/alacritty_colors.git
	
	# or clone the complete repo
	git clone https://github.com/dchakro/alacritty_colors.git
	
	cd alacritty_colors
	chmod +x show_colors.sh apply_theme.sh
	```

2. Enable `Live Config Reload` for alacritty if it is not enabled already by adding the followin line in your `~/.alacritty.yml`.

	```properties
	live_config_reload: true
	```
	
	Here is a shell command to do it.
	
	```shell
	echo "live_config_reload: true" >> ~/.alacritty.yml
	```

3. Overwrite the [base.yml](./base.yml) with your `~/.alacritty.yml`.

   ```sh
   cd /path/to/alacritty_colors
   cp ~/.alacritty.yml ./base.yml
   ```
	
4. (***Optional***) Remove the current color scheme (if any) from the file `base.yml`, so that the "**reset**" function in the included script will restore default alacritty colors. Otherwise it will restore your current color scheme. 

5. Apply/Backup/Reset themes using

   ```sh
   ./apply_theme.sh
   ```


## Info

If you want to view the colors from your current color scheme without cloning this repo, you can do so by running:

```sh
curl -sL 'https://raw.githubusercontent.com/dchakro/alacritty_colors/master/show_colors.sh' | bash
```

## Note:

+ Most of these themes are (as-is or modified) from [alacritty's wiki](https://github.com/alacritty/alacritty/wiki/Color-schemes).
+ While making this repo I didn’t realize that there are repos like [eendroroy’s](https://github.com/eendroroy/alacritty-theme) and [rajasegar's](https://github.com/rajasegar/alacritty-themes) repos where they have been putting in the effort for a long time. I will maintain this repo to archive other color schemes that I might find interesting over time.
  + Unlike their repos this repo provides open-source simple bash scripts to view the theme colors and apply the themes.

## Preview of themes

### [Argonaut](https://github.com/pwaleczek/Argonaut-theme)      [YML](themes/argonaut.yml)

![image-20200730153019490](assets/argonaut.png)

### Ayu Mirage    [YML](themes/ayuMirage.yml)

![image-20200730153019490](assets/ayuMirage.png)
### Birds of Paradise [YML](themes/birds_of_paradise.yml)

![birds of paradise](assets/birds of paradise.png)

### [Blood Moon](https://github.com/dguo/blood-moon)      [YML](themes/bloodmoon.yml)

Bright yellow changed to `#FFD700`

![image-20200730153216611](assets/bloodmoon.png)

### Breeze (KDE)    [YML](themes/breeze.yml)

![image-20200730153019490](assets/breeze.png)

### Breeze2     [YML](themes/breeze2.yml)

modified from KDE Breeze by robocopAlpha

![breeze2](./assets/breeze2.png)

### Darktooth    [YML](themes/darktooth.yml)

![image-20200730153019490](assets/darktooth.png)

### Dracula    [YML](themes/dracula.yml)

![image-20200730153019490](assets/dracula.png)

### Github Light [YML](themes/githubLight.yml)
![githubLight](assets/githubLight.png)

### Gruvbox    [YML](themes/gruvbox.yml)

![image-20200730153019490](assets/gruvbox.png)

### [Hyper](https://hyper.is/)     [YML](themes/hyper.yml)

The color Yellow `#FFD700` has taken from [Blood Moon](themes/bloodmoon.yml).

![image-20200730153904592](assets/hyper.png)

### Iterm Default    [YML](themes/iterm2.yml)

![image-20200730154037517](assets/iterm2.png)

### Kitty    [YML](themes/kitty.yml)

![image-20200730153019490](assets/kitty.png)

### [Material Theme](https://github.com/equinusocio/material-theme)    [YML](themes/material.yml)

![image-20200730154203299](assets/material.png)

### Metro Style      [YML](./themes/metrostyle.yml)

![metrostyle](assets/metrostyle.png)

### Monokai Soda      [YML](themes/monokaiSoda.yml)

![image-20200730154326639](assets/monokaiSoda.png)
### Monokai Soda version 2 [YML](themes/monokaiSoda2.yml)
Gray and white are changed from the base theme
![monokaisoda2](assets/monokaiSoda2.png)
### PaperColor Light [YML](themes/paperColorLight.yml)
![paper color light](assets/paperColorLight.png)


### Paraiso Dark [YML](themes/paraisoDark.yml)

![paraiso dark](assets/paraisoDark.png)
### Pencil Light [YML](themes/pencilLight.yml)
![pencil light](assets/pencilLight.png)

### Pop OS       [YML](themes/pop_OS.yml)

![image-20200730155432908](assets/pop_OS.png)

### robocopAlpha Colors     [YML](themes/robocopAlpha.yml)

![image-20200730160014996](assets/robocopAlpha.png)

### [Seabird](https://github.com/nightsense/seabird)      [YML](themes/seabird.yml)

Foreground color has been made darker `#1A1A1A` than original to improve contrast

![image-20200730154721260](assets/seabird.png)

### Spacemacs light     [YML](themes/spacemacsLight.yml)

Changes: green to `#009F6B` and magenta to `#29A0AD`.

![image-20200730160138239](assets/spacemacsLight.png)

### Spacer by robocopAlpha    [YML](./themes/spacer.yml)

Tried to map colors from the Spacemacs Light theme to ones “similar” to the names of the colors.

![spacer](assets/spacer.png)

### Terminal app basic       [YML](themes/terminalBasic.yml)

![image-20200730155241817](assets/terminalBasic.png)

### Ubuntu      [YML](themes/ubuntu.yml)

![image-20200730155325668](assets/ubuntu.png)

