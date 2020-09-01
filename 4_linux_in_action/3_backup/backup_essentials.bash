#!/bin/bash
# Author: Artsiom
# Date: 01/09/2020
# Description: Essential commands to create a backup
# Modified: 01/09/2020

# create backup of the whole system and transfer it to a backup serverx
# if smth changes on the file system which shpuld be backed up, than a new tar is created
# better to use rsync. rsync transfers only changes, not the whole archive
tar czvf - --one-file-system / /usr /var | ssh ubuntu@10.92.253.117 "cat > /home/ubuntu/myubuntu-backup-01-09-2020.tar.gz"
# Explanation
# 1 "czvf -" The dash outputs data to standard output, so it's automatically sent to remote server, after pipe "|" is applied
# 2 --one-file-system argument excludes all data from any file system besides the current one:w

# create backup of videos in home dir. Create local tar and send it to a backup server
find /home -iname "*.mp4" -exec tar rvf videos.tar {} \; | ssh ubuntu@10.92.253.117 "cat > videos-backup-01-09-2020.tar"

# create backup of current dir with "rsync". rsync sends only diff beteween changes
# create directory on a backup server
ssh username@10.0.3.141 "mkdir syncdirectory"
# backup everything in current directory
rsync -av * username@10.0.3.141:syncdirectory
