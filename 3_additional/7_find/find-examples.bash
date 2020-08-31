#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Show examples of how to search with find
# Modified: 31/08/2020

echo Search files and folders in current directory ignoring case
find . -iname "test*"
echo

echo "Search only files exactly matching name \"Test\""
find . -type f -name "Test*"
echo

echo "Search for dirs exactly matching name \"Test\""
find . -type d -name "Test"
echo

echo Find bash scripts in current directory by permission
find . -type f -perm 755
echo

echo Make bash scripts executable only for current user
find . -type f -perm 755 -exec chmod 700 {} \;
echo

echo Show number of empty files in home directory
find ~ -type f -empty 2> /dev/null | wc -l
echo

echo "Count files in home dir modified within the last 5 days (5d ago<--now)"
find ~ -mtime -5 2>/dev/null | wc -l
echo

echo "Count files in home dir modified 5 days ago or more (past<--5d ago)"
find ~ -mtime +5 2> /dev/null | wc -l
echo

echo "Count files in home dir modified exactly 5 days ago (5d ago)"
find ~ -mtime 5 2>/dev/null | wc -l
echo

echo "Show files in home dir with size > 100Mb"
find ~ -size +100M 2>/dev/null
echo
