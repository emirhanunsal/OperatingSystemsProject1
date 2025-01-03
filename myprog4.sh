#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Please run the script in this format: ./myprog4.sh <number>"
  exit 1
fi

#integer check
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: Input must be an integer. Please enter a valid number."
  exit 1
fi

number=$1

#declare an array
declare -a primeNumbers
primeCount=0

#check all prime numbers from 2 to the input's squareroot
for ((i=2; i<=number; i++)); do
  isPrime=true

  border=$(echo "sqrt($i)" | bc)
  for ((j=0; j<primeCount; j++)); do
    if [ ${primeNumbers[j]} -gt $border ]; then
      break
    fi
    if [ $((i % primeNumbers[j])) -eq 0 ]; then
      isPrime=false
      break
    fi
  done

  if $isPrime; then
    primeNumbers[primeCount]=$i
    primeCount=$((primeCount + 1))
  fi
done

for ((i=0; i<primeCount; i++)); do
  prime=${primeNumbers[i]}
  hexValue=$(printf "%x\n" $prime) #convert to hexadecimal
  echo "Hexadecimal of $prime is: $hexValue"
done
