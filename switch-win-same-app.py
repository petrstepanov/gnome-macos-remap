# Script not working due to AutoKey bug
# https://github.com/autokey/autokey/issues/117

keyboard.press_key('<alt>')
time.sleep(0.01)
#keyboard.fake_keypress('`')
keyboard.send_keys("`")
time.sleep(0.01)
keyboard.release_key('<alt>')