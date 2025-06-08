use std::error::Error;
use std::fmt;
use std::hint::black_box;
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

fn benchmark_div_success(iterations: usize) -> std::time::Duration {
    let start = Instant::now();
    let mut sum = 0.0;
    
    for i in 0..iterations {
        let x = black_box(10.0 + i as f64);
        let y = black_box(3.0);
        match div(x, y) {
            Ok(result) => sum += black_box(result),
            Err(_) => {},
        }
    }
    
    // Use the sum to prevent optimization
    black_box(sum);
    start.elapsed()
}

fn benchmark_div_error(iterations: usize) -> std::time::Duration {
    let start = Instant::now();
    let mut error_count = 0;
    
    for i in 0..iterations {
        let x = black_box(10.0 + i as f64);
        let y = black_box(0.0);
        match div(x, y) {
            Ok(_) => {},
            Err(_) => error_count += 1,
        }
    }
    
    // Use the error count to prevent optimization
    black_box(error_count);
    start.elapsed()
}

fn main() {
    let iterations = 100_000_000;
    
    println!("Rust Division Benchmark (Optimized)");
    println!("===================================");
    println!("Iterations: {}\n", iterations);
    
    // Benchmark successful division
    let duration1 = benchmark_div_success(iterations);
    println!("Successful divisions: {:?}", duration1);
    println!("Operations per second: {:.0}\n", iterations as f64 / duration1.as_secs_f64());
    
    // Benchmark division with error
    let duration2 = benchmark_div_error(iterations);
    println!("Error divisions: {:?}", duration2);
    println!("Operations per second: {:.0}", iterations as f64 / duration2.as_secs_f64());
}