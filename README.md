# Bash scripts
Bash scripts for downloading files, converting files, file compare, file filtering.  
Each .sh file has a .txt file explaining the usage and explaining the script choices.  
I use them in these situations:

## Situation 00: Directory setup to receive files.  
[00_copy_files_cond_to_new_dir.sh](00_copy_files_cond_to_new_dir.sh)  
[00_copy_files_cond_to_new_dir_usage.txt](00_copy_files_cond_to_new_dir_usage.txt)    

## Situation 01: Get clean file URLs from index.html
A website has hardcoded URL links to pdf files, so I copy the source index.html to the file and clean it to get a text file containing only the URLs, intending to pass it later to a batch downloading script.   
[01_bash_command_to_clean_pdf_urls_from_index.txt](01_bash_command_to_clean_pdf_urls_from_index.txt)    

## Situation 02: Batch download from url file
When I have to batch download from a text file containing urls, with wget, and later checking the file sizes.  
[02_download_pdfs.sh](02_download_pdfs.sh)  
[02_download_pdfs_usage.txt](02_download_pdfs_usage.txt)  
[02_get_file_sizes_from_dir_files.sh](02_get_file_sizes_from_dir_files.sh)  
[02_get_file_sizes_from_dir_files_usage.txt](02_get_file_sizes_from_dir_files_usage.txt)    

## Situation 03: Convert pdf to text
When I have to convert pdf files to text files, to clean them up so they can be converted to csv.  
Some pdf files are generated with text obfuscation, so when converted to text they won´t keep the layout, or word blocks get other words injected in between.  
[03_pdfs_to_text_with_ghostscript.sh](03_pdfs_to_text_with_ghostscript.sh)  
[03_pdfs_to_text_with_ghostscript_usage.txt](03_pdfs_to_text_with_ghostscript_usage.txt)  
[03_pdfs_to_text_with_pdfstotext.sh](03_pdfs_to_text_with_pdfstotext.sh)  
[03_pdfs_to_text_with_pdfstotext_usage.txt](03_pdfs_to_text_with_pdfstotext_usage.txt)    

## Situation 04: Compare sizes between process directories
When I have to compare file size bloat after conversion and cleaning, between directories.  
[04_compare_dir1_dir2_output.sh](04_compare_dir1_dir2_output.sh)  
[04_compare_dir1_dir2_output_usage.txt](04_compare_dir1_dir2_output_usage.txt)  
