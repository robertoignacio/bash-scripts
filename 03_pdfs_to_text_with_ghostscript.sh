#!/bin/bash

# Checks if user passed the argument, if not then exits.
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [pdf_files_directory]"
  exit 1
fi

# Creates a new directory to store the output text files.
# Based on the name of the PDF directory with "_text" appended.
pdf_dir="$1"
out_dir="${pdf_dir}_text"

mkdir -p "$out_dir"

# Get the number of all pdf files within $pdf_dir
total_files=$(ls -1 "$pdf_dir"/*.pdf | wc -l)
# Initialize a count variable to keep track of the processed pdf files
count=0

# Loop through all pdf files in the pdf_dir directory
for pdf_file in "$pdf_dir"/*.pdf; do
  count=$((count+1))
  echo "Converting file $count of $total_files: $pdf_file"
  base=$(basename "$pdf_file" .pdf)
  gs -q -dNOPAUSE -dBATCH -sDEVICE=txtwrite -sOutputFile="$out_dir/$base.txt" "$pdf_file" >/dev/null
done

echo "Conversion completed!"


