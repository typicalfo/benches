package main

import (
	"errors"
	"fmt"
	"time"
)

func div(x, y float64) (float64, error) {
	if y == 0 {
		return 0, errors.New("division by zero")
	}
	return x / y, nil
}

func benchmarkDiv(iterations int) time.Duration {
	start := time.Now()
	sum := 0.0
	
	for i := 0; i < iterations; i++ {
		x, y := 10.0+float64(i), 3.0
		if result, err := div(x, y); err != nil {
			// Handle error case
		} else {
			sum += result
		}
	}
	
	// Use the sum to prevent optimization
	_ = sum
	return time.Since(start)
}

func benchmarkDivWithError(iterations int) time.Duration {
	start := time.Now()
	errorCount := 0
	
	for i := 0; i < iterations; i++ {
		x, y := 10.0+float64(i), 0.0
		if _, err := div(x, y); err != nil {
			errorCount++
		}
	}
	
	// Use the error count to prevent optimization
	_ = errorCount
	return time.Since(start)
}

func main() {
	iterations := 100_000_000
	
	fmt.Printf("Go Division Benchmark (Optimized)\n")
	fmt.Printf("=================================\n")
	fmt.Printf("Iterations: %d\n\n", iterations)
	
	// Benchmark successful division
	duration1 := benchmarkDiv(iterations)
	fmt.Printf("Successful divisions: %v\n", duration1)
	fmt.Printf("Operations per second: %.0f\n\n", float64(iterations)/duration1.Seconds())
	
	// Benchmark division with error
	duration2 := benchmarkDivWithError(iterations)
	fmt.Printf("Error divisions: %v\n", duration2)
	fmt.Printf("Operations per second: %.0f\n", float64(iterations)/duration2.Seconds())
}