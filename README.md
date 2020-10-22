# Gnome → macOS Keyboard Remap

<figure>
  <img src="https://github.com/petrstepanov/gnome-macos-remap/blob/master/resources/gnome-macos-remap.png?raw=true" alt="Gnome macOS Remap Icon" />
</figure>

A bash script that remaps GNOME desktop keybindings to MacOS defaults. Very useful keyboard remap for users who run linux on Macbook laptops or computers with Apple keyboard. Or for those who simply prefer a MacOS keyboard over the regular PC keyboard. Here are some key remaps that are implemented:

* Finder key combinations work in Nautilus.
* Copy and Paste work in Terminal with `⌘ c`, `⌘ v`.
* Home and End keys defined to be `⌘ ←` and `⌘ →`.
* Workspace switching with `Ctrl ←` and `Ctrl →`.
* macOS window manager keyboard shortcuts: `⌘ ~`, `⌘ w`.
* Mission Contol <code><img style="vertical-align:text-bottom; height: 1em; width: auto" src="https://help.apple.com/assets/5E59C74D0946226F03EEDC17/5E59C7520946226F03EEDC2C/en_US/0a3719d8c9acde3a43680efa67ef11a2.png" alt="the Mission Control key"></code> and Launchpad <code><img style="vertical-align:text-bottom; height: 1em; width: auto" src="https://help.apple.com/assets/5E59C74D0946226F03EEDC17/5E59C7520946226F03EEDC2C/en_US/d6924e805b6d1a255218f1307a96ef25.png" alt="the Launchpad key"/></code> media keys are remapped.
* And more...

## How does it work?
The functionality is based on the Autokey mechanism. On top of that the default GNOME shell keybindings are modified as well. Therefore it will only work in X11 window system. Wayland is not supported.

## Install Prerequisities
In order to run the script one has to have `autokey` and `git` installed on the system. Please install these packages first with the package manager provided by your OS.

## Installation
Check out the repository to an arbitrary location and run the `install.sh` script in Terminal. Script will ask for administrator password.

```
git clone https://github.com/petrstepanov/gnome-macos-remap
cd gnome-macos-remap
sh install.sh
```

Open AutoKey preferences and make sure the "Automatically start AutoKey at login" checkbox is on. 
System restart is required in order for the remap to start working.

## How to uninstall
Navigate into the program directory in Terminal and run `uninstall.sh`.
