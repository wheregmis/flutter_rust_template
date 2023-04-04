// This file initializes the dynamic library and connects it with the stub
// generated by flutter_rust_bridge_codegen.

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:flutter_rust_bridge_template/bindings/gen_api_1.dart';
import 'package:flutter_rust_bridge_template/bindings/gen_api_config.dart';

const root = 'pkg/native';

final api1 = ApiClassOneImpl.wasm(
  WasmModule.initialize(kind: const Modules.noModules(root: root)),
);

final enableRustBindings = ApiConfigImpl.wasm(
  WasmModule.initialize(kind: const Modules.noModules(root: root)),
);
