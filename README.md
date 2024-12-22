# Hyprland and some additional configurations for an easy and minimal setup

## Additional Packages used

- [hyprpaper](https://github.com/hyprwm/hyprpaper)
- [hyprlock](https://github.com/hyprwm/hyprlock) not yet properly implemented
- [waybar](https://github.com/Alexays/Waybar) with [my configuration](https://github.com/paulbknhs/waybar)
- [rofi](https://github.com/davatorium/rofi) including custom applets from [adi1090x](https://github.com/adi1090x/rofi)

## Installation

> [!NOTE]
> Since Hyprland creates a default configuration you
> need to exit hyprland first before cloning this repo

```bash
# Install Hyprland and co
sudo pacman -S hyprland waybar hyprpaper

# Optional but recommended dependencies for my setup
sudo pacman -S kitty firefox thunar

# Backup existing configuration and clone the repository
mv ~/.config/hypr ~/.config/hypr.bak
git clone https://github.com/paulbknhs/hypr ~/.config/hypr
```
