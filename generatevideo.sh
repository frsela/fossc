#!/bin/bash
mencoder mf://@frames.txt -mf fps=$1:type=png \ -of lavf -ovc lavc -lavcopts vcodec=flv:mbd=2:v4mv:mv0:trell:cbp:last_pred=3:vbitrate=200 -o $2.flv
mplayer $2.flv 
