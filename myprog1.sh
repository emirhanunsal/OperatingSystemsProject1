#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Please write in this format: ./myprog1.sh <string> <int>"
    exit 1
fi

input="$1"
number="$2"
result=""
alphabet="abcdefghijklmnopqrstuvwxyz"

if [ "$number" -lt 10 ]; then
    newNumber=""
    for (( i=0; i<${#input}; i++ )); do
        newNumber+="$number"
    done
    number="$newNumber"
fi

for (( i=0; i<${#input}; i++ )); do
    currentChar="${input:$i:1}"
    add="${number:$i:1}"

    index=$(expr index "$alphabet" "$currentChar")

    if [ "$index" -ne 0 ]; then
        newIndex=$(( (index + add - 1) % ${#alphabet} ))
        result+="${alphabet:$newIndex:1}"
    else
        result+="$currentChar"
    fi
done

echo "$result"
