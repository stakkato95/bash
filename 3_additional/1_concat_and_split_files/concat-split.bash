#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Concatenate multiple files into one and split into files with 2 entries

cat EU.txt America.txt Asia.txt > Continents.txt
split -l 3 Continents.txt ContinentsList_
