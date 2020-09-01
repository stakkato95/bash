#!/bin/bash
# Author: Artsiom
# Date: 01/09/2020
# Description: Synchronize home folder with an AWS S3 bucket
# Modified: 01/09/2020

aws s3 sync /home/my-user s3://my-bucket
