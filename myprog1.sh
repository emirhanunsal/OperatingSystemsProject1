#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Please run the script in this format: ./myprog1.sh <string> <int>"
    exit 1
fi

input="$1"
number="$2"
result=""
alphabet="abcdefghijklmnopqrstuvwxyz"

#second input integer checker
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Second parameter must be an integer containing only digits."
    exit 1
fi

#if second input is only one digit
if [ "$number" -lt 10 ]; then
    newNumber=""
    for (( i=0; i<${#input}; i++ )); do
        newNumber+="$number"
    done
    number="$newNumber"
fi

#if string's length is greater than the integer
if [ ${#input} -gt ${#number} ]; then
    echo "Error: Length of string is greater than the length of the integer. Please run the script again."
    exit 1
fi

#if string's length is less than the integer
if [ ${#input} -lt ${#number} ]; then
    echo "Error: Length of string is less than the length of the integer. Please run the script again."
    exit 1
fi


#
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
