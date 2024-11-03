#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please run the script in this format: ./myprog5.sh \"xyz*\""
    exit 1
fi

#finding all files matching the pattern and separating them by NULL character
find . -type f -name "$1" -print0 | while IFS= read -r -d '' file; do
    echo "Deleting: $file"
    rm "$file"
done

echo "All files matching '$1' have been deleted."
