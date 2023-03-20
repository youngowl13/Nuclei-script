#!/bin/bash

# Read the URLs from the input file
input_file="$1"
urls=($(cat "$input_file"))

# Loop through the URLs and run a nuclei scan for each URL
for url in "${urls[@]}"; do
  echo "Scanning $url..."

  # Create the output file name based on the URL
  output_file=$(echo "$url" | sed 's/\//_/g').xml

  # Run the nuclei scan and save the output to the output file
  nuclei -u "$url" -o "$output_file" -store-resp

  echo "Scan complete for $url"
done

echo "All scans complete"

