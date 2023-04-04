flutter_rust_bridge_codegen --rust-input "native/src/api_authentication.rs" "native/src/api_config.rs"\
        --dart-output "lib/bindings/gen_api_authentication.dart" "lib/bindings/gen_api_config.dart"\
        --class-name Authentication ApiConfig\
        --rust-output "native/src/bindings/generated_api_authentication.rs" "native/src/bindings/generated_api_config.rs" --wasm
  

## removing the first two lines of lib.rs inside of native/src
# sed -n '2,/^mod bindings;/p' native/src/lib.rs > native/src/bindings/mod.rs


