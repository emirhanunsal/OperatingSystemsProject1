#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please run the script in this format: ./myprog5.sh \"xyz*\""
    exit 1
fi

#all files to the array
files=($(find . -type f -name "$1"))

#exit if there is no file
if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matches with '$1'."
    exit 1
fi

#delete all files in array
for file in "${files[@]}"; do
    echo "Deleting: $file"
    rm "$file"
done

echo "All files matching '$1' have been deleted."
