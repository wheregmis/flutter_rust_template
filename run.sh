#!/bin/bash

# Check if watchexec is installed
if ! command -v watchexec &> /dev/null; then
    echo "watchexec not found, installing watchexec-cli..."
    cargo install watchexec-cli
fi

# Replace 'your_binding_script.sh' with the actual name of your binding script
binding_script="./generate.sh"

# Find specific files to watch and create a regex pattern
files_to_watch=$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' | sed 's/native\/src\///' | paste -sd'|' -)

# Create the watchexec command
watchexec_cmd="watchexec -w native/src -e rs -i native/src/lib.rs -i '*/bindings/*' -- $binding_script"


# Print the watchexec command
echo "Generated watchexec command: $watchexec_cmd"

# # Run the watchexec command
eval "$watchexec_cmd"


