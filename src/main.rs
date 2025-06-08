use std::error::Error;
use std::fmt;

#[derive(Debug)]
struct DivError;

impl fmt::Display for DivError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "division by zero")
    }
}

impl Error for DivError {}

fn div(x: f64, y: f64) -> Result<f64, DivError> {
    if y == 0.0 {
        Err(DivError)
    } else {
        Ok(x / y)
    }
}

fn main() {
    let (x, y) = (1., 0.);
    match div(x, y) {
        Ok(z) => println!("The result is: {}", z),
        Err(e) => eprintln!("Division failed: {}", e),
    }
}