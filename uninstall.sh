#!/bin/bash

# FRevert the default Control and Command behaviour
sudo cp /usr/share/X11/xkb/symbols/pc.bak /usr/share/X11/xkb/symbols/pc

# Uninstall Autokey repository
rm -rf ~/.config/autokey/data/gnome-macos-phrases

# Tweak standard GNOME keybindings
gsettings reset org.gnome.desktop.wm.keybindings activate-window-menu
gsettings reset org.gnome.desktop.wm.keybindings close
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

gsettings reset org.gnome.shell.keybindings toggle-application-view
gsettings reset org.gnome.shell.keybindings toggle-message-tray

gsettings reset org.gnome.mutter.keybindings toggle-tiled-left
gsettings reset org.gnome.mutter.keybindings toggle-tiled-right

gsettings reset org.gnome.mutter.wayland.keybindings restore-shortcuts

gsettings reset org.gnome.settings-daemon.plugins.media-keys window-screenshot
gsettings reset org.gnome.settings-daemon.plugins.media-keys area-screenshot
gsettings reset org.gnome.settings-daemon.plugins.media-keys screensaver

gsettings reset org.gnome.terminal.legacy.keybindings new-tab
gsettings reset org.gnome.terminal.legacy.keybindings new-window
gsettings reset org.gnome.terminal.legacy.keybindings close-tab
gsettings reset org.gnome.terminal.legacy.keybindings close-window
gsettings reset org.gnome.terminal.legacy.keybindings find
