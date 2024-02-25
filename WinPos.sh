#!/bin/sh

# Window positioner
# Author: Reza Rezaei
# Worked with one of these passed arguments : right, left, topright, botright, topleft, botleft, full
# All right positions will be palced at the two third of screen at the right side and left positions will be placed at the one third at the left side
# bot and top positions will split screen vertically in half and will follow the one or two third rull for left and right
# It uses xdotool application 
# For best use should be combined with bind keys on operating system 

position=$1

echo $position

disgeo=`xdotool getdisplaygeometry`
disgeoarr=($disgeo)
disx=${disgeoarr[0]}
disy=${disgeoarr[1]}

echo "disx = $disx"
echo "disy = $disy"

case $position in
     right)
        (( width=  $disx / 3 * 2 - 10 ))
        (( height= $disy - 25 ))
        (( x= $disx / 3 + 10 ))
        (( y= 0 ))
        ;;
    left)
        (( width=  $disx / 3 - 70  ))
        (( height= $disy - 25 ))
        (( x= 70 ))
        (( y= 0 ))
        ;;
    topright)
        (( width=  $disx / 3 * 2 - 10  ))
        (( height= $disy / 2 - 35 ))
        (( x= $disx / 3 + 10 ))
        (( y= 0 ))
        ;;
    botright)
        (( width=  $disx / 3 * 2 - 10  ))
        (( height= $disy / 2 - 35 ))
        (( x= $disx / 3 + 10 ))
        (( y= $disy / 2 ))
        ;;
    topleft)
        (( width=  $disx / 3 - 70  ))
        (( height= $disy / 2 - 35 ))
        (( x= 70 ))
        (( y= 0 ))
        ;;
    botleft)
        (( width=  $disx / 3 - 70  ))
        (( height= $disy / 2 - 35 ))
        (( x= 70 ))
        (( y= $disy / 2 ))
        ;;
    full)
        (( width=  $disx - 70  ))
        (( height= $disy - 25 ))
        (( x= 70 ))
        (( y= 0 ))
        ;;
    *)
esac
echo "width= $width"
echo "height = $height"

winid=`xdotool getwindowfocus`
 xdotool windowsize $winid $width $height
 xdotool windowmove $winid $x $y
