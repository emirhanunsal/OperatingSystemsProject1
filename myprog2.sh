#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please run the script in this format: ./myprog2.sh output_filename.txt"
    exit 1
fi

output_file="$1"

#overwrite the file
if [ -f "$output_file" ]; then
    read -p "$output_file already exists. Do you want to overwrite? (Y/n): " choice
    case "$choice" in
        [Yy]* ) echo "Overwriting...";;
        [Nn]* ) echo "Operation canceled."; exit 1;;
        * ) echo "Invalid choice. Operation canceled."; exit 1;;
    esac
fi

#set the line numbers according to random number generator
set_line_number() {
    random_number=$((RANDOM % 3 + 1))

    case $random_number in
        1)
            line_number=1
            ;;
        2)
            line_number=3
            ;;
        3)
            line_number=5
            ;;
    esac
}

> "$output_file"

set_line_number
sed -n "${line_number}p" "giris.txt" >> "$output_file"

set_line_number
sed -n "${line_number}p" "gelisme.txt" >> "$output_file"

set_line_number
sed -n "${line_number}p" "sonuc.txt" >> "$output_file"

echo "New text have been written to $output_file."
