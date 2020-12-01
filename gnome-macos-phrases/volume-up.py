# Enter script code
system.exec_command("amixer set Master unmute; amixer -D pulse sset Master 10%+", getOutput=False)