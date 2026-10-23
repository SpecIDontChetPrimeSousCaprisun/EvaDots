# EVANGELION dots

This is an opiniated rice for hyprland on the theme of the anime Neon Genesis Evangelion.

## Installing

Here is a list of supported distros :
- arch
- debian

Select the distro of your choice then install it, you will only need a minimal setup.
This can also probably work on existing installs.

Then install git:
- arch: `sudo pacman -S --needed base-devel git`
- deb: `sudo apt install git`

Then clone the repo and use the Makefile !

```
git clone https://github.com/SpecIDontChetPrimeSousCaprisun/EvaDots.git
cd EvaDots
make install
```

Please also see [On the first startup](#on-the-first-startup)

## Updating

Just go to the dots dit from the clone and run `git pull`

## On the first startup

To get your wallpaper open kitty by pressing `ctrl-Q` then run `awww img ~/walls/wallhaven-9512z8_2560x1440.png`
You should also configue your p10k (see [https://github.com/romkatv/powerlevel10k/tree/master](https://github.com/romkatv/powerlevel10k/tree/master))

You might also want to take a look at [the keybinds.](#keybinds)

## Keybinds

`super` is the `windows` key on most keyboards

- `sudper-Q`: terminal
- `super-R`: app launcher
- `super-G`: web browser
- `super shift-S`: take screeshot
- `f11`: fullscreen
- `super-V`: float window

All keybinds can be changed in the hyprland config.
