#!/bin/bash

# Install autokey phrases and scripts
bash ./bin/install-autokey.sh "$1"

# Remap CTRL and COMMAND. Change default GNOME keybindings in dconf.
bash ./bin/install-dconf.sh

echo ""
echo "Almost there! Please do following:"
echo "1. Open 'autokey-gtk'. Go to Edit -> Preferences."
echo "   Select 'Automatically start AutoKey at login'."
echo "2. Restart your computer."
echo "3. On the login screen click the gear icon on the bottom right."
echo "   Select 'GNOME on Xorg'. Login."
echo "4. Enjoy!"
