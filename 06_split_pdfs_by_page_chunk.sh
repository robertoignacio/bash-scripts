#!/bin/bash

# Check if file path was provided as argument
if [ -z "$1" ]; then
  echo "Error: Please provide a file path as argument"
  exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
  echo "Error: File not found: $1"
  exit 1
fi

# Get the number of pages in the file
pages=$(pdfinfo "$1" | grep Pages | awk '{print $2}')

# Calculate the number of output files
output_files=$(( pages / 800 ))
if (( pages % 800 != 0 )); then
  output_files=$(( output_files + 1 ))
fi

# Split the file into output files
for (( i=0; i<output_files; i++ )); do
  start_page=$(( i * 800 + 1 ))
  end_page=$(( (i + 1) * 800 ))
  if (( end_page > pages )); then
    end_page=$pages
  fi
  output_file="$(basename "$1" .pdf)-$(printf "%02d" $(( i + 1 )))".pdf
  pdftk "$1" cat $start_page-$end_page output "$output_file"
done
