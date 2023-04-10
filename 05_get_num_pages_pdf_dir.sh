#!/bin/bash

# Check if directory path was provided as argument
if [ -z "$1" ]; then
  echo "Error: Please provide a directory path as argument"
  exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory not found: $1"
  exit 1
fi

# Loop through all PDF files in the directory
for file in "$1"/*.pdf; do
  # Get the number of pages using pdfinfo
  pages=$(pdfinfo "$file" | grep Pages | awk '{print $2}')

  # Construct output string
  output="$file,$pages"

  # Write the output to the output file
  filename=$(basename -- "$file")
  filename="${filename%.*}"
  echo "$output" >> "${filename}_pages.txt"
done
