#!/bin/bash
# samplePic.sh
# Generates a montage image of all the files.
# Requires the ImageMagick.
# Usage: Copy the script into the file where the target images is located.
#	 run the command "sudo ./samplePic.sh *JPG
# Author: Fred Fury

echo “samplePic.sh”
echo “Shrinking images…”
mkdir -p ./sample
for var in "$@"
do
	echo "$var"
	bash -c "convert -resize 10% $var ./sample/$var"
done

echo "Merging..."
# In original usage,  30 photos are combined into a 5x6 image with 0 borders.
bash -c "montage -tile 5x6 -geometry +0+0 ./sample/*.JPG sample.jpg"
echo “Done.”
