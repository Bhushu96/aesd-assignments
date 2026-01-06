#!/bin/sh

# Check that both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Missing arguments"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check that filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Count number of files
num_files=$(find "$filesdir" -type f | wc -l)

# Count number of matching lines
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

exit 0
