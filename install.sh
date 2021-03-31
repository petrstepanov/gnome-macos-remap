#!/bin/bash

# Backup curent /usr/share/X11/xkb/symbols/pc
if [ ! -f /usr/share/X11/xkb/symbols/pc.bak ]; then
  echo "Backing up /usr/share/X11/xkb/symbols/pc..."
  sudo cp /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.bak
fi

echo "Flipping Super and Control keys..."
sudo sed -i 's/<LCTL> {\t\[ Control_L/<LCTL> {\t\[ Super_L/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<LWIN> {\t\[ Super_L/<LWIN> {\t\[ Control_L/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<RCTL> {\t\[ Control_R/<RCTL> {\t\[ Super_R/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<RWIN> {\t\[ Super_R/<RWIN> {\t\[ Control_R/' /usr/share/X11/xkb/symbols/pc
  
# Install Autokey repository
mkdir -p ~/.config/autokey/data
rm -rf ~/.config/autokey/data/gnome-macos-phrases
if [ -z "$1" ]; then
  # No argumant supplied
  echo "Copying AutoKey Phrases..."
  cp -r ${PWD}/gnome-macos-phrases ~/.config/autokey/data/
else
  # Argument supplied
  echo "Linking AutoKey Phrases..."
  ln -s ${PWD}/gnome-macos-phrases ~/.config/autokey/data/gnome-macos-phrases
fi  

# Tweak standard GNOME keybindings
echo "Changing default GNOME keybindings..."
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"
gsettings set org.gnome.desktop.wm.keybindings close "['<Primary>w']"
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "['LaunchA']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Primary>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Primary><Shift>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Primary>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Primary><Shift>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Left']"

gsettings set org.gnome.shell.keybindings toggle-application-view "['LaunchB']"
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"

gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"

gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "[]"

gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot "['<Primary><Shift>numbersign']"
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Primary><Shift>dollar']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "[]"

# Setting relocatable schema
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Primary>t'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window '<Primary>n'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab '<Primary>w'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window '<Primary>q'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find '<Primary>f'

# Disable Left Super Overlay Shortcut
gsettings set org.gnome.mutter overlay-key 'Super_R'

echo ""
echo "Almost there! Please do following:"
echo "1. Open 'autokey-gtk'."
echo "   In Edit -> Preferences select 'Automatically start AutoKey at login'."
echo "2. Restart your computer."
echo "3. Enjoy!"
