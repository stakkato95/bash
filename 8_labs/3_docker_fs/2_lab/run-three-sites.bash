#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Run three containers with same site content on ports 81, 82, 83 of host OS
# Modified: 18/09/2020

for i in {1..3}
do
	echo "Starting container $i..."
	sudo docker run --rm -d -v $(pwd)/site:/home --expose 80 -p 8$i:80 busybox httpd -h /home -f
done

echo "5 sec pause before stopping containers..."
sleep 5

sudo docker stop $(docker ps -aq)
echo "All containers stopped"
