# Script prevents window close by unsetting and setting the dconf value
# It works, but has a downside - some delay

# Examples found here:
# https://python.hotexamples.com/examples/gi.repository.Gio/Settings/-/python-settings-class-examples.html

# Some Gio docs here:
# https://lazka.github.io/pgi-docs/#Gio-2.0/classes/Settings.html#Gio.Settings.reset

from gi.repository.Gio import Settings as GSettings
import time

KB_SCHEMA = 'org.gnome.Terminal.Legacy.Keybindings'
KB_PATH = '/org/gnome/terminal/legacy/keybindings/'

gsettings = GSettings(schema=KB_SCHEMA, path=KB_PATH)

# Reset close tab combination to default "<Control><Shift>f"
# https://lazka.github.io/pgi-docs/#Gio-2.0/classes/Settings.html#Gio.Settings.reset
gsettings.reset('find')

# Wait till settings applied and send combination
time.sleep(0.2)
keyboard.send_keys('<ctrl>+f')

# Alternative:
# keyboard.press_key('<ctrl>')
# keyboard.fake_keypress('f')
# keyboard.release_key('<ctrl>')

# Sleep 1/2 seconds for the system to process the event
time.sleep(0.5)

# Revert the close tab keyboard shortcut 
# https://lazka.github.io/pgi-docs/#Gio-2.0/classes/Settings.html#Gio.Settings.set_string
gsettings.set_string('find', '<Primary>f')
