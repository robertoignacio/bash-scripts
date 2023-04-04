#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
  echo "Error: $1 directory does not exist"
  exit 1
fi

# Loop over all files in the directory
for file in "$1"/*; do
  # Get the size of the file in megabytes
  size=$(du -h "$file" | awk '{print $1}')
  # Print the filename and size in megabytes
  echo "$(basename "$file") $size"
done