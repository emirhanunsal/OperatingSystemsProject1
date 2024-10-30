#!/bin/bash

count=0
#check if writable dir exists
if [ ! -d writable ]; then
    mkdir writable
fi

#move all files to the writable dir
for file in *; do
    if [ -f "$file" ] && [ -w "$file" ]; then
        mv "$file" writable/
        count=$((count + 1))  
    fi
done

echo "$count files moved to the directory "writable""
