#!/bin/bash
#
#
# Author: René Gulager Larsen <div@renegulager.dk>
#
#
#
# This script dont fix anything!!!
# It it   just a way to get a easy overview  and a starting point for future analyses
# IF you search a lot of files there wil be a lot if diskIO and load on your server!
#
#The searchFunctions are a list of things that i have found in different hacked files, eg the /usr/bin/perl
# a bit strange to have in a php file.
#
searchFunctions=(
    base64_encode
    base64_decode
    eval
    str_rot13
    gzinflate
    preg_replace

)

searchStrings=(
  /usr/bin/perl
)



len=${#searchFunctions[*]}
i=0
echo "Searching for functions "
echo ""

while [ $i -lt $len ]; do
    echo "  // -------------- checking for '${searchFunctions[$i]}()'" --------------------------
    grep -rn --color --include=*.php --include=*.dat "^[^#]*[^a-zA-Z_]${searchFunctions[$i]}[[:space:]]*(" *;
    echo ""
    let i++
done



echo "Searching for STRINGS"
echo ""

len=${#searchStrings[*]}
i=0


while [ $i -lt $len ]; do
    echo "  // -------------- checking for '${searchStrings[$i]}'" --------------------------
    grep -rn --color --include=*.php --include=*.dat "${searchStrings[$i]}" *;
    echo ""
    let i++
done
