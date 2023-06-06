#!/bin/bash

# Check if a directory argument is provided
if [[ -n "$1" ]]; then
  target_dir="$1"
else
  target_dir="$SCRATCH"
fi

# Get the list of top-level directories
directories=$(find "$target_dir" -mindepth 1 -maxdepth 1 -type d)

# Initialize total file count, total file size, and file number limit
total_file_count=0
total_file_size=0
file_number_limit=1000000

# Loop through each directory
for directory in $directories; do
  # Extract and output the directory name
  dir_name=$(basename "$directory")
  echo "Directory:  $dir_name"

  # Count the number of files in the directory
  file_count=$(find "$directory" -type f | wc -l)

  # Add to the total file count
  ((total_file_count+=file_count))

  # Calculate the size of files in the directory and convert to GB
  file_size_kb=$(du -sk "$directory" | awk '{print $1}')
  file_size_gb=$(awk "BEGIN {printf \"%.1f\", $file_size_kb/1024/1024}")

  # Add to the total file size
  total_file_size_kb=$((total_file_size_kb + file_size_kb))

  # Output the file count and size
  echo "File count: $file_count"
  echo "File size:  $file_size_gb GB"
  echo
done

# Convert total file size from kilobytes to gigabytes
total_file_size_gb=$(awk "BEGIN {printf \"%.1f\", $total_file_size_kb/1024/1024}")

# Output the total file count
echo "Summary for $target_dir"
echo "Total files:     $total_file_count"
echo "Total file size: ${total_file_size_gb} GB"

# Calculate and output the percentage
percentage=$(awk "BEGIN { pc=100*${total_file_count}/${file_number_limit}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
echo "Percentage:      $percentage%"
