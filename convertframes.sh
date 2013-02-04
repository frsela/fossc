#!/bin/bash
find -name "frame*.raw" -exec ffmpeg -vframes 1 -vcodec rawvideo -f rawvideo -pix_fmt rgb32 -s 320x480 -i {}  -f image2 -vcodec png {}.png \;
rm *raw
