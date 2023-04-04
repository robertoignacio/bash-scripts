#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 url_file.txt"
  exit 1
fi

# Create directory to store downloaded PDF files
if [ ! -d "pdf_files" ]; then
  mkdir pdf_files
fi

# Download PDF files from URLs in the text file
while read url; do
  wget -P pdf_files "$url"
done < "$1"

echo "Finished downloading PDF files to pdf_files/ directory"