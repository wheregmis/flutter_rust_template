flutter_rust_bridge_codegen --rust-input "native/src/api_1.rs" "native/src/api_2.rs" \
        --dart-output "lib/bindings/gen_api_1.dart" "lib/bindings/gen_api_2.dart" \
        --class-name ApiClassOne ApiClassTwo \
        --rust-output "native/src/bindings/generated_api_1.rs" "native/src/bindings/generated_api_2.rs" --wasm
        # --rust-crates-dir native/src/api_1 native/src/api_2 \
  