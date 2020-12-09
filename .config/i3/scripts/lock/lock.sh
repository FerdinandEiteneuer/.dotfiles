#!/bin/bash

# lock icon
ICON=$HOME/.config/i3/scripts/lock/lock_icon2.png

# create a temporary screenshot of the background
TMPBG=/tmp/screen.png
scrot /tmp/screen.png

# rescale background up and down to create pixelized version of background
convert $TMPBG -scale 10% -scale 1000% $TMPBG

# impose lock icon on top of pixelized background
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

# activate the lock using the fancy background
i3lock -u -i $TMPBG

# cleanup
rm /tmp/screen.png
