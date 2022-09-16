# GNOME → macOS Keyboard Remap

This keyboard remap is based on [Autokey](https://github.com/autokey/autokey) functionality. Therefore it currently works with Xorg only. Wayland solution is [in early development and is published here](https://github.com/petrstepanov/gnome-macos-remap-wayland).

<figure>
  <img src="https://github.com/petrstepanov/gnome-macos-remap/blob/master/resources/gnome-macos-remap.png?raw=true" alt="Gnome macOS Remap Icon" />
</figure>

Migrating to Linux from a Mac? This bash script remaps native GNOME desktop environment keybindings to the macOS defaults. Very useful keyboard remap for Linux users who are running GNOME on a Macbook, Mac or a PC with Apple keyboard. Don't spend time getting used to the default GNOME keybindings. Run the script and use your Linux just like you do use your Mac. Here are some key remaps that are implemented:

* Command key `⌘` set as main system modifier key.
* Copy and Paste work in Terminal with `⌘ c`, `⌘ v`. Regular interrupt `ctrl c` works in Terminal.
* Nautilus keyboard hotkeys replaced with the Finder ones: navigate in and out of folder, delete folder, new folder...
* Home and End keys assigned to macOS defaults `⌘ ←` and `⌘ →`.
* Workspace switching works with `ctrl ←` and `ctrl →`.
* Some macOS window manager keyboard shortcuts are implemented: application switcher `⌘ tab`, `⌘ ~`, close window `⌘ w`.
* Mission Contol <img src="https://help.apple.com/assets/5E59C74D0946226F03EEDC17/5E59C7520946226F03EEDC2C/en_US/0a3719d8c9acde3a43680efa67ef11a2.png" alt="the Mission Control key" height="16px"> and Launchpad <img src="https://help.apple.com/assets/5E59C74D0946226F03EEDC17/5E59C7520946226F03EEDC2C/en_US/d6924e805b6d1a255218f1307a96ef25.png" alt="the Launchpad key" height="16px"/> media keys are remapped.
* And more...

## How does it work?
The functionality is based on the Autokey mechanism. On top of that the default GNOME shell keybindings are modified as well. Therefore it will only work in X11 window system. Wayland is not supported.

## Prerequisities
Make sure you are using X11, not Wayland. Logout from your session. On the GNOME login screen find and click gear icon. Select option "GNOME on Xorg". Log back in.

Install [Git](https://github.com/git/git) and [AutoKey](https://github.com/autokey/autokey) with package manager of your choice: 
* On Debian based distributions (Ubuntu, Zorin...) run `sudo apt-get install git autokey-gtk`.
* On Pop!_OS run `sudo apt-get install git autokey-common autokey-gtk`.
* On Fedora run `sudo dnf install git autokey autokey-gtk`.

## Installation
1. Make sure you are running `Xorg` display server. If not sure logout from your session. On the GNOME login screen click ⚙ icon on the bottom right. Select `GNOME on Xorg`. Log in.
2. Check out the repository to some arbitrary location and run the `install.sh` script in Terminal. Script will ask for administrator password.

```
mkdir -p ~/Downloads && cd ~/Downloads
rm -rf ./gnome-macos-remap
git clone https://github.com/petrstepanov/gnome-macos-remap
cd gnome-macos-remap
chmod +x ./install.sh ./uninstall.sh
./install.sh
```

3. Open AutoKey (`autokey-gtk`). In Edit -> Preferences menu make sure the `Automatically start AutoKey at login` checkbox is on. 
3. Restart your computer.

## Postinstall notes
* To get a functionality similar to the macOS Spotlight, I recommend installing the [Ulauncher application](https://ulauncher.io/). You can assign the `⌘ space` hotkey for the Ulauncher in its settings.
* To replicate the emoji selector in macOS, there are at least two options:
    * Smile emoji selector for Linux is a great alternative. Install [here](https://flathub.org/apps/details/it.mijorus.smile). Assign macOS-like keyboard combination `ctrl ⌘ space` via custom keyboard shortcuts in GNOME settings.
    * Emote is another option. Install via `snap` [here](https://snapcraft.io/emote), or via other means detailed in the official repo [here](https://github.com/tom-james-watson/Emote). After installation, you can assign a macOS-like keyboard combination `ctrl ⌘ space` by opening the application, clicking on the hamburger menu ☰, then `Keyboard Shortcuts`.
* To enable gestures on X11 install [touchegg](https://github.com/JoseExposito/touchegg) followed up by the [X11 Gestures GNOME extension](https://extensions.gnome.org/extension/4033/x11-gestures/).
* <s>Current implementation requires re-installing the script after each kernel update</s>.
* Logitech MX series keyboard users please [use Solaar to set your keyboard to use macOS layout](https://github.com/petrstepanov/gnome-macos-remap/issues/12).

## How to uninstall
1. Navigate into the program directory in Terminal and run `./uninstall.sh`.
2. Restart your computer.

## How to contribute
Please run the `./install.sh dev` command. This will create a symbolic link for autokey scripts from the repository into the autokey settings. Therefore it will be easy to add or modify AutoKey scripts and introduce the pull request to the repoisitory.

## Changelog

`Sep 16, 2022` • Updated install script to resolve conflicting hotkeys.

`Apr 23, 2022` • Changed setup mode from global (for all users) to local user. Fixed the `ctrl d` delete line shortcut workflow.

`Apr 22, 2022` • Added support for new Screenshot tool in GNOME 42.

`Mar 30, 2022` • Tweaked some Nano key combinations in Terminal.

`Dec 16, 2021` • Fixed the `ctrl w` keyboard shortcut in Terminal.

`Dec 14, 2021` • Improved pasting in GNOME Terminal.

`Dec 13, 2021` • Fixed deprecated overlay hotkey introduced in GNOME 41.

`Apr 30, 2021` • Added support for GNOME 40 horizontal workspace switching.

## Rodmap
Some hotkeys need to be implemented on the application-specific basis. However a [regexp-related issue](https://github.com/autokey/autokey/issues/161) in Autokey prevents doing it at the moment. More macOS hotkeys will be implemented once this issue is resolved.

After Autokey 0.96.0 is released there will be a major update to account on the new filtering system implementation.
