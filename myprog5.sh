#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please run the script in this format: ./myprog5.sh \"xyz*\""
    exit 1
fi

#All files to the array
files=($(find . -type f -name "$1"))

#Delete files in array
for file in "${files[@]}"; do
    echo "Deleting: $file"
    rm "$file"
done

echo "All files matching '$1' have been deleted."
