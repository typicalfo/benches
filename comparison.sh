#!/bin/bash

echo "🚀 Go vs Rust Division Benchmark"
echo "================================="
echo ""

# Build binaries
echo "Building..."
go build -o bench_go bench_go.go
cargo build --release --bin division_bench > /dev/null 2>&1

echo ""

# Run benchmarks and capture output
echo "Running benchmarks..."
go_output=$(./bench_go 2>&1)
rust_output=$(./target/release/division_bench 2>&1)

# Extract times and ops/sec using grep and awk
go_success_time=$(echo "$go_output" | grep "Successful divisions:" | awk '{print $3}')
go_success_ops=$(echo "$go_output" | grep "Operations per second:" | head -n1 | awk '{print $4}')
go_error_time=$(echo "$go_output" | grep "Error divisions:" | awk '{print $3}')
go_error_ops=$(echo "$go_output" | grep "Operations per second:" | tail -n1 | awk '{print $4}')

rust_success_time=$(echo "$rust_output" | grep "Successful divisions:" | awk '{print $3}')
rust_success_ops=$(echo "$rust_output" | grep "Operations per second:" | head -n1 | awk '{print $4}')
rust_error_time=$(echo "$rust_output" | grep "Error divisions:" | awk '{print $3}')
rust_error_ops=$(echo "$rust_output" | grep "Operations per second:" | tail -n1 | awk '{print $4}')

echo "📊 RESULTS (100M iterations)"
echo "============================="
echo ""
echo "🟦 SUCCESS PATH:"
echo "Go:   $go_success_time ($go_success_ops ops/sec)"
echo "Rust: $rust_success_time ($rust_success_ops ops/sec)"
echo ""
echo "🔴 ERROR PATH:"
echo "Go:   $go_error_time ($go_error_ops ops/sec)"  
echo "Rust: $rust_error_time ($rust_error_ops ops/sec)"
echo ""

# Calculate percentage differences
if [[ -n "$go_success_ops" && -n "$rust_success_ops" ]]; then
    if (( rust_success_ops > go_success_ops )); then
        echo "🏆 SUCCESS WINNER: Rust"
        diff=$(python3 -c "print(f'{(($rust_success_ops - $go_success_ops) / $go_success_ops * 100):.1f}')")
        echo "   Rust is ${diff}% faster"
    else
        echo "🏆 SUCCESS WINNER: Go"
        diff=$(python3 -c "print(f'{(($go_success_ops - $rust_success_ops) / $rust_success_ops * 100):.1f}')")
        echo "   Go is ${diff}% faster"
    fi
    echo ""
fi

if [[ -n "$go_error_ops" && -n "$rust_error_ops" ]]; then
    if (( rust_error_ops > go_error_ops )); then
        echo "🏆 ERROR WINNER: Rust"
        diff=$(python3 -c "print(f'{(($rust_error_ops - $go_error_ops) / $go_error_ops * 100):.1f}')")
        echo "   Rust is ${diff}% faster"
    else
        echo "🏆 ERROR WINNER: Go"
        diff=$(python3 -c "print(f'{(($go_error_ops - $rust_error_ops) / $rust_error_ops * 100):.1f}')")
        echo "   Go is ${diff}% faster"
    fi
fi

# Clean up
rm -f bench_go