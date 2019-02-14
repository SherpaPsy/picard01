#!/bin/sh
echo "What makes you think I’m lookin’ for trouble?" 
# Prefer to do this on one line, but as its multiple commands, going to if it out.
if  newman run Picard01.postman_collection.json; then
	echo "Newman delivers again!"
else
	echo "Test failed - stopping container" 
	if docker container stop $1;then
		echo "Container $1 shutdown completed"
	else
		echo "Oh oh! Problem down by the docks!"
	fi
	exit 1
fi

