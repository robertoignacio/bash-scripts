#!/bin/bash

# Check that the script was called with two arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 directory_one directory_two"
    exit 1
fi

# Store the directory paths in variables
dir1=$1
dir2=$2

# Initialize the output file
output="sizes.txt"

# Loop over PDF files in directory one
for pdf_file in "$dir1"/*.pdf; do
    # Extract the base filename without extension
    base_filename=$(basename "$pdf_file" .pdf)

    # Check if corresponding TXT file exists in directory two
    txt_file="$dir2/$base_filename.txt"
    if [ ! -f "$txt_file" ]; then
        continue
    fi

    # Get file sizes in bytes
    pdf_size=$(stat -c "%s" "$pdf_file")
    txt_size=$(stat -c "%s" "$txt_file")

    # Convert file sizes to human-readable format
    pdf_size_hr=$(numfmt --to=iec --padding=7 "$pdf_size")
    txt_size_hr=$(numfmt --to=iec --padding=7 "$txt_size")

    # Calculate size difference factor
    size_diff_factor=$(bc <<< "scale=2; $txt_size / $pdf_size")

    # Append output to file
    echo "$pdf_file $pdf_size_hr | $txt_file $txt_size_hr | Size difference factor: $size_diff_factor" >> "$output"
done


# Output results to user
echo "Comparison results have been saved to $output"


