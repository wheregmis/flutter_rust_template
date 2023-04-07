#![allow(unused_variables)]



// create a function to divide two numbers
pub fn divide(a: i32, b: i32) -> i32 {
    // check if the divisor is zero
    if b == 0 {
        // if it is, return zero
        0
    } else {
        // if it is not, return the quotient
        a / b
    }
}

// function to multiply two numbers
pub fn multiply(a: i32, b: i32) -> i32 {
    // return the product
    a * b
}




// Testing Changes 