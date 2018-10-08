#!/bin/bash

setxkbmap -layout us

xmodmap -e 'clear Lock'
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9 = Caps_Lock'
xmodmap -e 'add Lock = Caps_Lock'

xmodmap -e 'keycode 112 = Left'
xmodmap -e 'keycode 117 = Right'

