#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Process a file with names
# Modified: 30/08/2020

sed '/^$/d' names.txt | sed 's/ /\t/g' | sed 's/Jahne/Jerry/g' | sed '/Gabriel/d' | sed 's/Paul/_____/g' | sed '4s/Smith/SMITH/g' | sed G > names-modified.txt
