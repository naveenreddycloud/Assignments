#!/bin/bash

if [ $# -ne 3 ]; # 1.directory 2. findstring 3.replacestring
    then 
        echo "usage:<directory>,<find_string>,<replace_string>"
        exit 1
fi

DIRECTORY=$1
FIND_STRING=$2
REPLACE_STRING=$3

if [ ! -d $DIRECTORY ]
    then
        echo "Directory not found"
        exit 1
fi

# iterate over the all .txt files in that directory
for file in "$DIRECTORY"/*.txt;
 do
   if [ -f "$file" ]; then
    echo "processing file: $file"
    sed -i.bak "s/${FIND_STRING}/${REPLACE_STRING}/g" "$file"  # Use sed to replace the string and save changes in-place
   fi
done
echo "Replacement completed"