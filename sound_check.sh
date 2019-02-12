#!/bin/bash
arecord -D hw:3,0 -f dat -d 30 -c 1 /tmp/test.wav 2> /dev/null
sox /tmp/test.wav /tmp/out.wav bandpass 4920 50
sox /tmp/out.wav -n spectrogram -z 50 -o /tmp/spectrogram.png
if [[ $(find /tmp/spectrogram.png -type f -size +8300c 2>/dev/null) ]]; then
  date
  cp /tmp/test.wav /mnt/share/noise/`date +%Y%m%d%H%m%S`.wav
fi
