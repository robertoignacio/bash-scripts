#!/bin/bash

# Check if source and destination directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path to source dir> <path to destination dir>"
    exit 1
fi

# Define source and destination directories
src_dir="$1"
dest_dir="$2"

# Create the destination directory if it doesn't exist
mkdir -p "$dest_dir"

# Copy files less than 5 MB in size to the destination directory
find "$src_dir" -maxdepth 1 -type f -size -5M -exec cp {} "$dest_dir" \;
