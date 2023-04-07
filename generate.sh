
RUST_INPUT="$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' | \
sed 's/"/\\"/g' | \
awk '{printf "\"%s\" ", $0}')"


DART_OUTPUT="$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' | \
sed 's/native\/src\///; s/\.rs/\.dart/' | \
xargs -I{} echo "\"lib/.bindings/gen_{}\"" | tr '\n' ' ')"


## todo: Class is not capitalized
CLASS_NAME="$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' \
| xargs -I{} basename {} .rs | perl -pe 's/(^|_)([a-z])/\u$2/g; s/^([a-z])/\u$1/' \
| tr '\n' ' ' | rev | cut -c 2- | rev)"



RUST_OUTPUT="$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' | \
sed 's/native\/src\///; s/\.rs/\.rs/' | \
xargs -I{} echo "\"native/src/bindings/gen_{}\"" | tr '\n' ' ')"





# echo "Rust input files: $(echo ${RUST_INPUT} | tr '\n' ' ')"
# echo "Dart output files: ${DART_OUTPUT}"
# echo "Class name: ${CLASS_NAME}"
# echo "Rust output files: ${RUST_OUTPUT}"

COMMAND="flutter_rust_bridge_codegen --rust-input ${RUST_INPUT}--dart-output ${DART_OUTPUT}--class-name ${CLASS_NAME} --rust-output ${RUST_OUTPUT}--wasm"

# Execute the command
eval "$COMMAND"

# flutter_rust_bridge_codegen --rust-input "native/src/api_authentication.rs" "native/src/api_config.rs"\
#         --dart-output "lib/.bindings/gen_api_authentication.dart" "lib/.bindings/gen_api_config.dart"\
#         --class-name Authentication ApiConfig\
#         --rust-output "native/src/bindings/generated_api_authentication.rs" "native/src/bindings/generated_api_config.rs" --wasm

# flutter_rust_bridge_codegen --rust-input "native/src/api_authentication.rs" "native/src/api_config.rs"\
#  --dart-output "lib/.bindings/gen_api_authentication.dart" "lib/.bindings/gen_api_config.dart"\
#  --class-name ApiAuthentication ApiConfig\
#  --rust-output "native/src/bindings/gen_api_authentication.rs" "native/src/bindings/gen_api_config.rs" --wasm
  

# removing the first two lines of lib.rs inside of native/src
sed -n '2,/^mod bindings;/p' native/src/lib.rs > native/src/bindings/mod.rs
#!/bin/bash

# Replace 'source_rust_file.rs' with the actual name of the Rust file containing the lines to copy
source_rust_file="native/src/lib.rs"

# Replace 'target_rust_file.rs' with the actual name of the Rust file to which the lines should be appended
target_rust_file="native/src/bindings/mod.rs"

FILE_COUNT=$(find native/src -type f -name '*.rs' ! -path '*/bindings/*' ! -name 'lib.rs' | wc -l)

# Copy the first three lines from the source file to the target file
head -n $FILE_COUNT "$source_rust_file" > "$target_rust_file"

# Append the lines from the source file to the target file
output_file="native/src/updated_lib.rs"

# Delete the first two lines
sed "1,${FILE_COUNT}d" "$source_rust_file" > "$output_file"

# Replace the original file with the updated one
mv "$output_file" "$source_rust_file"



