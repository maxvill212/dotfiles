#!/bin/bash

if ["$EUID" -ne 0] then
	printf "You're not root, it's kind've important in this case..."
	exit
fi

# Create home folders
printf "Creating home folders"
mkdir ~/Documents ~/Downloads ~/Pictures

# Set shell to zsh
printf "Checking Shell"
if [basename $SHELL != zsh] then
	pacman -S zsh wget
	chsh -s /usr/binzsh
	printf "Shell changed to zsh"
else
	printf "Default shell was already zsh"
fi

# Install oh-my-zsh
printf "Installing oh-my-zsh"
$ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install yay
printf "Installing git, then yay"
pacman -S git
git clone https://aur.archlinux.org/yay-git.git ~/Downloads
makepkg -si ~/Downloads/yay-git

# Download main programs
printf "Intalling main programs"
yay -S alacritty amd-ucode brightnessctl firefox htop hwinfo ly man man-db neofetch networkmanager grub os-prober pamixer pavucontrol ranger rofi sway swayidle swaylock vim waybar wdisplays-git weston wget xorg-server-xwayland github-cli


# Enable ly
systemctl enable ly.service && systemctl start ly.service

# Copy config files over
printf "Copying config files to there proper destination"
cp config ~/.config

# Reboot script
read -p "Install complete, would you like to restart now? y/n " -n 1 -r ans

if [$ans = y]  then
	reboot
else
	exit
fi

#End of script
