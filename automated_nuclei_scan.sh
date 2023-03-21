#!/bin/bash

set -euo pipefail

# Define the input file and output directory
input_file="$1"
output_dir="$(pwd)/output"

# Create the output directory if it does not exist
mkdir -p "$output_dir"

# Define the number of concurrent scans to run
concurrent_scans=4

# Define a function to run the nuclei scan for a URL
run_scan() {
  url="$1"
  echo "Scanning $url..."
  output_file="$output_dir/$(echo "$url" | sed 's#^https\?://##;s#/#_#g').xml"
  nuclei -u "$url" -o "$output_file" -store-resp >/dev/null 2>&1
  echo "Scan complete for $url"
}

# Loop through the URLs and run the nuclei scans concurrently using xargs
cat "$input_file" | xargs -n1 -P "$concurrent_scans" -I{} bash -c 'run_scan "$@"' _ {}

echo "All scans complete"