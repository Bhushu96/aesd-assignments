#!/bin/sh

# Check that both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Missing arguments"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Create directory path if it does not exist
writedir=$(dirname "$writefile")

if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir" || {
        echo "Error: Could not create directory $writedir"
        exit 1
    }
fi

# Write string to file (overwrite if exists)
echo "$writestr" > "$writefile" || {
    echo "Error: Could not create or write to file $writefile"
    exit 1
}

exit 0
