#!/bin/bash

count=0

if [ ! -d writable ]; then
    mkdir writable
fi

for file in *; do
    if [ -f "$file" ] && [ -w "$file" ]; then
        mv "$file" writable/
        count=$((count + 1))  
    fi
done

echo "$count files moved to the directory writable"
