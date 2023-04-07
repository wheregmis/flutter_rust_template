#!/bin/bash

# Check if watchexec is installed
if ! command -v watchexec &> /dev/null; then
    echo "watchexec not found, installing watchexec-cli..."
    cargo install watchexec-cli
fi

# Replace 'your_binding_script.sh' with the actual name of your binding script
binding_script="./generate.sh"


# Find specific files to watch and create a string with --watch flags
files_to_watch=$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' -exec echo -n '-w {} ' \;)

# Create the watchexec command
watchexec_cmd="watchexec -r -e rs $files_to_watch -- $binding_script"

# Remove extra spaces in the watchexec command
watchexec_cmd_clean=$(echo "$watchexec_cmd" | tr -s ' ')

# Print the clean watchexec command
echo "Generated watchexec command: $watchexec_cmd_clean"

# Run the clean watchexec command
eval "$watchexec_cmd_clean"

