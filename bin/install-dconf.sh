#!/bin/bash

# Flip Super and Control keys
echo "Flipping Super and Control keys..."

# If xkb backup exists from previous version install - remove it
if [ -f /usr/share/X11/xkb/symbols/pc.bak ]; then
  sudo cp -f /usr/share/X11/xkb/symbols/pc.bak /usr/share/X11/xkb/symbols/pc
  sudo rm -rf /usr/share/X11/xkb/symbols/pc.bak
fi

# Flip Super and Control keys - per user setting
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swap_lwin_lctl', 'ctrl:swap_rwin_rctl']"

# Install Autokey was here

# Revert combinations used in previous script versions
gsettings reset org.gnome.desktop.wm.keybindings close

# Tweak standard GNOME keybindings
echo "Changing default GNOME keybindings..."
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

# Command outputs e.g. "GNOME Shell 40.6"
GNOME_VERSION_STR=`gnome-shell --version`

# Bug on Pop!_OS 20.04. The `gnome-shell --version` command outputs empty string. 
# Therefore we input in manually. On Pop!_OS 21.10 this is fixed.
if [ -z "$GNOME_VERSION_STR" ]
then
  GNOME_VERSION_STR="GNOME Shell 3.36"
fi

# Extract integer GNOME version with REGEX
REGEX="GNOME Shell ([0-9]+)"
if [[ "$GNOME_VERSION_STR" =~ $REGEX ]]
then
  GNOME_VERSION_INT=${BASH_REMATCH[1]}
  echo "Detected GNOME version $GNOME_VERSION_INT"
fi

# Apply dconf tweaks
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Primary>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Primary><Shift>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Primary>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Primary><Shift>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "[]"

# Workspace switching hotkeys
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-down
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-up
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-left
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-right

# Workspace switching is horizontal starting GNOME 40
if (( GNOME_VERSION_INT >= 40 )); then
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Left']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Right']"
else
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Right']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Left']"
fi

gsettings set org.gnome.desktop.wm.keybindings minimize "['<Primary>m']"

# Overview hotkey moved to "/org/gnome/shell/keybindings/" starting Gnome 41
if (( GNOME_VERSION_INT >= 41 )); then
  gsettings set org.gnome.shell.keybindings toggle-overview "['LaunchA']"
else
  gsettings set org.gnome.shell.keybindings toggle-overview "['LaunchA']"
  gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]"
fi

# Show applications view
gsettings set org.gnome.shell.keybindings toggle-application-view "['LaunchB']"

# Other stuff
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"

gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"

gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "[]"

if (( GNOME_VERSION_INT >= 42 )); then
  gsettings set org.gnome.shell.keybindings screenshot "['<Primary><Shift>numbersign']"
  gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Control>dollar']"
  gsettings set org.gnome.shell.keybindings screenshot-window "['<Shift><Control>percent']"
else
  gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot "['<Primary><Shift>numbersign']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Primary><Shift>dollar']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot "['<Primary><Shift>percent']"
fi

gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "[]"

# Setting relocatable schema
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy '<Primary>c'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste '<Primary>v'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Primary>t'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window '<Primary>n'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab '<Primary>w'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window '<Primary>q'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find '<Primary>f'

# Disable Left Super Overlay Shortcut
gsettings set org.gnome.mutter overlay-key 'Super_R'
