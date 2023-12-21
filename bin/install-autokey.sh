#!/bin/bash

# Install Autokey phrases and scripts
mkdir -p ~/.config/autokey/data
rm -rf ~/.config/autokey/data/gnome-macos-phrases

if [ -z "$1" ]; then
  # No argument specified
  echo "Copying AutoKey Phrases..."
  cp -r ${PWD}/gnome-macos-phrases/ ~/.config/autokey/data/
else
  # Argument specified
  echo "Linking AutoKey Phrases..."
  ln -s ${PWD}/gnome-macos-phrases ~/.config/autokey/data/gnome-macos-phrases
fi

# Resolve overlapping key combinations
echo 'Please select your "Command+Backspace" functionality.'
PS3='Answer 1 or 2: '
select opt in "Nautilus - Delete resource" "Text editing - Delete line"; do
	case $opt in
		"Nautilus - Delete resource")
			rm ~/.config/autokey/data/gnome-macos-phrases/delete-line.py
			rm ~/.config/autokey/data/gnome-macos-phrases/.delete-line.json
			break
			;;
		"Text editing - Delete line")
			rm ~/.config/autokey/data/gnome-macos-phrases/nautilus-delete.txt
			rm ~/.config/autokey/data/gnome-macos-phrases/nautilus-delete.json
			break
			;;
		*) echo "invalid option $REPLY"
		;;
	esac
done


