# Kawaegle dotfiles

## Introduction
These are my dotfiles I use as a daily driver. It contains config files for kitty and nvim mostly, but you can also find configs for ZSH, ranger or mvp. In `script`, you can find little scripts I did too.

## Documentation
I'm currently working on documentation. As soon as these dots were originally made for me, I didn't take the time to comment them really well, neither document them.
But you can already find my NVim's configuration documentation [here](nvim/README.md), and my zsh config [here](zsh/README.md).

## GDB
I use GDB [pwndbg](https://github.com/pwndbg/pwndbg) plugins so make sure you have it too (and installed at the same place).

## rizin (WIP)
Rizin configuration that is maybe effective on cutter

## Terminal
My main terminal is [kitty](https://github.com/kovidgoyal/kitty), I use the builtin tokyonight themes and add some customization on. 

## tmux (WIP)
Terminal multiplexer

## Curent Desktop Environment (WIP)
I use [hyprland](https://github.com/hyprwm/Hyprland) as DE with wlsunset for bluelight protection and no such more configuration for the moment.

## MPV
configuration of MPV maybe stollen on reddit.

## Nvim (WIP)
go see [Here](nvim/README.md) 

## Ranger
File manager for mostly of my work not really configured too just switch from ueberzug to kitty because it's unmaintained.

## QBittorrent
Torrent downloader with the catpuccin themes

## Script
### 4down
download thread from [4chan](https://4chan.org) with or without image from shell
### GhostInTheNet
hide our MAC address on the network so It leave anon trace on network.
### dmc.sh
Compute the distance bettween us and a wi-fi signal from [this equation](https://raw.githubusercontent.com/cryptolok/DMC/master/formula.png)

## ZSH
### alias
all alias I need to get the work done
### themes
my poor attempt to create zsh prompts themes
### zshrc
the main zsh file that source all other file I need.
### plugins
- calc: allow zsh to understand and do arthmical operation
- colored-man-pages: because color on man is sexy
- countdown: setup a countdown that return true
- extract: aliased on `x`, allow user to extract most of compressed file without pain
- gitprompt: for my themes get all element from got repository (mostly change)
- listbox: select with interactive choice
- sudo: add/remove sudo in front of command by ESC ESC sequence
### Environment
Manage my environment variable in a file so I don't stick on a specific file architecture.

## Systemd
### Xremap
remap at kernel level CapsLock into ESC using user systemd
### Lock (WIP)
lock the computer and suspend it (maybe not in the DotAsh because of systemd)

# Installation
The fast easy way to install that dotfile is to use
[DotAsh](https://github.com/oppaiweeb/dotash) but have a look before applying them.
