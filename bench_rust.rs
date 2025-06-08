use std::error::Error;
use std::fmt;
use std::time::Instant;

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

fn benchmark_div(iterations: usize) -> std::time::Duration {
    let start = Instant::now();
    
    for _ in 0..iterations {
        let (x, y) = (10.0, 3.0);
        match div(x, y) {
            Ok(_) => {},
            Err(_) => {},
        }
    }
    
    start.elapsed()
}

fn benchmark_div_with_error(iterations: usize) -> std::time::Duration {
    let start = Instant::now();
    
    for _ in 0..iterations {
        let (x, y) = (10.0, 0.0);
        match div(x, y) {
            Ok(_) => {},
            Err(_) => {},
        }
    }
    
    start.elapsed()
}

fn main() {
    let iterations = 100_000_000;
    
    println!("Rust Division Benchmark");
    println!("=======================");
    println!("Iterations: {}\n", iterations);
    
    // Benchmark successful division
    let duration1 = benchmark_div(iterations);
    println!("Successful divisions: {:?}", duration1);
    println!("Operations per second: {:.0}\n", iterations as f64 / duration1.as_secs_f64());
    
    // Benchmark division with error
    let duration2 = benchmark_div_with_error(iterations);
    println!("Error divisions: {:?}", duration2);
    println!("Operations per second: {:.0}", iterations as f64 / duration2.as_secs_f64());
}