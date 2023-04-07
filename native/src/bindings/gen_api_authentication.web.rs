use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_divide(port_: MessagePort, a: i32, b: i32) {
    wire_divide_impl(port_, a, b)
}

#[wasm_bindgen]
pub fn wire_multiply(port_: MessagePort, a: i32, b: i32) {
    wire_multiply_impl(port_, a, b)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: impl Wire2Api for JsValue

impl Wire2Api<i32> for JsValue {
    fn wire2api(self) -> i32 {
        self.unchecked_into_f64() as _
    }
}
