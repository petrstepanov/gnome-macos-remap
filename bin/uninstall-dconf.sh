#!/bin/bash

# Force move backup mapping file to original
if [ -f /usr/share/X11/xkb/symbols/pc.bak ]; then
  echo "Restoring Super and Control behaviour ..."
  sudo mv -f /usr/share/X11/xkb/symbols/pc.bak /usr/share/X11/xkb/symbols/pc
fi

# Revert standard GNOME keybindings
echo "Reverting default GNOME keybindings..."
gsettings reset org.gnome.desktop.wm.keybindings activate-window-menu
gsettings reset org.gnome.desktop.wm.keybindings panel-main-menu
gsettings reset org.gnome.desktop.wm.keybindings show-desktop
gsettings reset org.gnome.desktop.wm.keybindings switch-applications
gsettings reset org.gnome.desktop.wm.keybindings switch-applications-backward
gsettings reset org.gnome.desktop.wm.keybindings switch-group
gsettings reset org.gnome.desktop.wm.keybindings switch-group-backward
gsettings reset org.gnome.desktop.wm.keybindings switch-input-source
gsettings reset org.gnome.desktop.wm.keybindings switch-input-source-backward
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-down
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-up
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-left
gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-right
gsettings reset org.gnome.desktop.wm.keybindings minimize

gsettings reset org.gnome.shell.keybindings toggle-overview
gsettings reset org.gnome.shell.keybindings toggle-application-view
gsettings reset org.gnome.shell.keybindings toggle-message-tray

gsettings reset org.gnome.mutter.keybindings toggle-tiled-left
gsettings reset org.gnome.mutter.keybindings toggle-tiled-right

gsettings reset org.gnome.mutter.wayland.keybindings restore-shortcuts

if (( GNOME_VERSION_INT >= 42 )); then
  gsettings reset org.gnome.shell.keybindings screenshot
  gsettings reset org.gnome.shell.keybindings show-screenshot-ui
  gsettings reset org.gnome.shell.keybindings screenshot-window
else
  gsettings reset org.gnome.settings-daemon.plugins.media-keys screenshot
  gsettings reset org.gnome.settings-daemon.plugins.media-keys area-screenshot
  gsettings reset org.gnome.settings-daemon.plugins.media-keys window-screenshot
fi

gsettings reset org.gnome.settings-daemon.plugins.media-keys screensaver

gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window
gsettings reset org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find

# Revert Left Super Overlay Shortcut
gsettings reset org.gnome.mutter overlay-key

gsettings reset org.gnome.desktop.input-sources xkb-options 