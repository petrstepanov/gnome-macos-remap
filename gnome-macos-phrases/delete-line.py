# Get the class of the currently-focused window:
winClass = window.get_active_class()

# if this is an Emacs window:
if not "Nautilus" in winClass:
    keyboard.send_keys("<shift>+<home>")
    keyboard.send_keys("<backspace>")