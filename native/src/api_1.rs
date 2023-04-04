#![allow(unused_variables)]

// create a function which accepts username and password and returns a boolean
// indicating whether the user is authenticated
pub fn authenticate(username: String, password: String) -> bool {
    // check if the username and password are correct
    if username == "admin" && password == "admin" {
        // if they are, return true
        true
    } else {
        // if they are not, return false
        false
    }
}


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
