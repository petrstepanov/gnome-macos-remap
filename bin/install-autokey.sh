#!/bin/bash

# Install Autokey phrases and scripts
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
