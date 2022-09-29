#!/bin/bash

LINK=(

	'' # LINKS HERE

)

mkdir my-videos
cd mkdir my-videos

CNT=0

for URL in ${LINK[@]}
do
	CNT=$((CNT + 1))
	mkdir $CNT
	cd $CNT

	(
		DIR="${URL##*/}"

		wget $URL'segment-'{0..1500}.ts

		echo $DIR'segment-'{0..1500}.ts | tr " " "\n" > tslist
		while read line; do cat $line >> $CNT.mp4; done < tslist

		rm -rf media* tslist
	) &
	cd ..

done

wait