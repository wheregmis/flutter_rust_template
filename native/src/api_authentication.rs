#![allow(unused_variables)]

// create a function which accepts a name and return a gf name
pub fn get_gf_name(name: String) -> String {
    // check if the name is correct
    if name == "admin" {
        "Kajal".to_string()
    } else {
        // if they are not, return false
        "Not Found".to_string()
    }
}
