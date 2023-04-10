#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide the directory path as an argument."
    exit 1
fi

dir_path=$1
file_count=$(ls -1 "$dir_path" | wc -l)

echo $file_count
