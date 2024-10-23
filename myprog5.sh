#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please run the script in this format: ./myprog5.sh xyz*"
    exit 1
fi

for file in $(find . -type f -name "$1"); do
    echo "Deleting: $file"
    rm "$file"
done

echo "All files matching '$1' have been deleted."
