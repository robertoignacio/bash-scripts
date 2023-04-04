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

# Create directory to store text files
if [ ! -d "$1/text_files" ]; then
  mkdir "$1/text_files"
fi

# Get the total number of PDF files in the directory
pdf_count=$(find "$1" -maxdepth 1 -name "*.pdf" | wc -l)

# Set the counter variable to 0
counter=0

# Convert PDF files to text files
for file in "$1"/*.pdf; do
  base=$(basename "$file" .pdf)
  pdftotext "$file" "$1/text_files/$base.txt"
  ((counter++))
  percentage=$((counter * 100 / pdf_count))
  echo "Completed $percentage%: $file"
done

echo "Finished converting PDF files to text files in $1/text_files/ directory"
