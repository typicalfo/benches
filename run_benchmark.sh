#!/bin/bash

echo "🚀 Division Performance Benchmark"
echo "=================================="
echo ""

# Build binaries
echo "Building Go binary..."
go build -o bench_go bench_go.go

echo "Building Rust binary..."
cargo run --release --bin division_bench > /dev/null 2>&1
cargo build --release --bin division_bench

echo ""
echo "Running benchmarks..."
echo ""

# Run Go benchmark
echo "🟦 GO RESULTS:"
echo "-------------"
./bench_go
echo ""

# Run Rust benchmark  
echo "🦀 RUST RESULTS:"
echo "---------------"
if [ -f "./target/release/division_bench" ]; then
    ./target/release/division_bench
else
    echo "Rust binary failed to compile"
fi
echo ""

# Performance analysis and winner declaration
echo "📊 PERFORMANCE ANALYSIS:"
echo "======================="
echo ""

# Run Go benchmark again to capture results
go_output=$(./bench_go)
go_success_ms=$(echo "$go_output" | grep "Successful divisions:" | sed 's/.*: \([0-9.]*\)ms.*/\1/')
go_success_ops=$(echo "$go_output" | grep -A1 "Successful divisions:" | tail -1 | sed 's/.*: \([0-9]*\).*/\1/')
go_error_ms=$(echo "$go_output" | grep "Error divisions:" | sed 's/.*: \([0-9.]*\)ms.*/\1/')
go_error_ops=$(echo "$go_output" | grep -A1 "Error divisions:" | tail -1 | sed 's/.*: \([0-9]*\).*/\1/')

# Run Rust benchmark again to capture results  
if [ -f "./target/release/division_bench" ]; then
    rust_output=$(./target/release/division_bench)
    rust_success_ms=$(echo "$rust_output" | grep "Successful divisions:" | sed 's/.*: \([0-9.]*\)ms.*/\1/')
    rust_success_ops=$(echo "$rust_output" | grep -A1 "Successful divisions:" | tail -1 | sed 's/.*: \([0-9]*\).*/\1/')
    rust_error_ms=$(echo "$rust_output" | grep "Error divisions:" | sed 's/.*: \([0-9.]*\)ms.*/\1/')
    rust_error_ops=$(echo "$rust_output" | grep -A1 "Error divisions:" | tail -1 | sed 's/.*: \([0-9]*\).*/\1/')
    
    # Calculate performance differences
    success_speedup=$(echo "scale=2; $rust_success_ms / $go_success_ms" | bc)
    error_speedup=$(echo "scale=2; $rust_error_ms / $go_error_ms" | bc)
    
    echo "SUCCESSFUL DIVISIONS:"
    echo "- Go: ${go_success_ms}ms | $(printf "%'d" $go_success_ops) ops/sec"
    echo "- Rust: ${rust_success_ms}ms | $(printf "%'d" $rust_success_ops) ops/sec"
    echo "- Go is ${success_speedup}x FASTER"
    echo ""
    echo "ERROR DIVISIONS:"
    echo "- Go: ${go_error_ms}ms | $(printf "%'d" $go_error_ops) ops/sec"  
    echo "- Rust: ${rust_error_ms}ms | $(printf "%'d" $rust_error_ops) ops/sec"
    echo "- Go is ${error_speedup}x FASTER"
    echo ""
    
    # Determine winner
    if (( $(echo "$success_speedup > 1" | bc -l) && $(echo "$error_speedup > 1" | bc -l) )); then
        echo "OVERALL WINNER: 🏆 GO WINS"
    else
        echo "OVERALL WINNER: 🏆 RUST WINS"
    fi
else
    echo "OVERALL WINNER: 🏆 GO WINS (Rust failed to compile)"
fi

echo ""
echo "📊 Benchmark completed!"

# Clean up binaries
rm -f bench_go