#!/bin/bash
FRAME=0
ADB=adb

rm -f frame*

echo "To stop recording, press CTRL+C . . ."

while [ $FRAME -gt -1 ]; do
	FRAME=$(( $FRAME + 1 ))
	echo Getting shot number $FRAME
	$ADB pull /dev/graphics/fb0 frame$FRAME.raw
	echo frame$FRAME.raw.png >> frames.txt
done
