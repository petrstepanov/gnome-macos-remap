#!/bin/bash

# Flip Control and Command (Super) keyboard keys
if [ ! -f /usr/share/X11/xkb/symbols/pc.bak ]; then
  sudo cp /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.bak
else
  sudo cp -f /usr/share/X11/xkb/symbols/pc.bak /usr/share/X11/xkb/symbols/pc
fi
sudo sed -i 's/<LCTL> {\t\[ Control_L/<LCTL> {\t\[ Super_L/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<LWIN> {\t\[ Super_L/<LWIN> {\t\[ Control_L/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<RCTL> {\t\[ Control_R/<RCTL> {\t\[ Super_R/' /usr/share/X11/xkb/symbols/pc
sudo sed -i 's/<RWIN> {\t\[ Super_R/<RWIN> {\t\[ Control_R/' /usr/share/X11/xkb/symbols/pc
  
# Install Autokey repository
mkdir -p ~/.config/autokey/data
cp -r ./gnome-macos-phrases ~/.config/autokey/data/

# Tweak standard GNOME keybindings
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

gsettings set org.gnome.Terminal.Legacy.Keybindings new-tab "['<Primary>t']"
gsettings set org.gnome.Terminal.Legacy.Keybindings new-window "['<Primary>n']"
gsettings set org.gnome.Terminal.Legacy.Keybindings close-tab "['<Primary>w']"
gsettings set org.gnome.Terminal.Legacy.Keybindings close-window "['<Primary>q']"
gsettings set org.gnome.Terminal.Legacy.Keybindings find "['<Primary>f']"

# Disable Left Super Overlay Shortcut
gsettings set org.gnome.mutter overlay-key "['Super_R']"
