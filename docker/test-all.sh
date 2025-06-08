#!/bin/bash

# Test all language implementations
# Exit on first error for quick feedback
set -e

echo "=== Multi-Language Division Test Suite ==="
echo "Testing all implementations for division by zero handling..."
echo

# Create results directory
mkdir -p results

# Function to test an implementation
test_impl() {
    local name="$1"
    local command="$2"
    echo "Testing $name..."
    
    # Run the command and capture output
    if output=$(eval "$command" 2>&1); then
        echo "✅ $name: $output"
        echo "$name: SUCCESS - $output" >> results/test_results.txt
    else
        echo "❌ $name: FAILED - $output"
        echo "$name: FAILED - $output" >> results/test_results.txt
        return 1
    fi
    echo
}

# Initialize results file
echo "=== Test Results $(date) ===" > results/test_results.txt
echo >> results/test_results.txt

# Test each implementation
echo "--- Core Languages ---"
test_impl "Go" "go run languages/div.go"
test_impl "Rust" "rustc languages/div.rs -o div_rust && ./div_rust"
test_impl "C" "gcc languages/div.c -o div_c && ./div_c"
test_impl "C++" "g++ languages/div.cpp -o div_cpp && ./div_cpp"

echo "--- Systems Programming ---"
test_impl "Zig" "zig run languages/div.zig"
test_impl "D" "gdc languages/div.d -o div_d && ./div_d"
test_impl "V" "v run languages/div.v"
test_impl "Odin" "odin run languages/div.odin -file"

echo "--- High-Level Languages ---"
test_impl "JavaScript" "node languages/div.js"
test_impl "Python" "python3 languages/div.py"
test_impl "Ruby" "ruby languages/div.rb"
test_impl "Perl" "perl languages/div.pl"
test_impl "PHP" "php languages/div.php"
test_impl "Lua" "lua5.3 languages/div.lua"
test_impl "LuaJIT" "luajit languages/div_jit.lua"

echo "--- High-Performance Runtimes ---"
test_impl "JavaScript (Bun)" "bun run languages/div_bun.js"
test_impl "TypeScript (Bun)" "bun run languages/div_bun.ts"

echo "--- JVM Languages ---"
test_impl "Java" "javac languages/div.java && java div"
test_impl "Kotlin" "source ~/.sdkman/bin/sdkman-init.sh && kotlinc languages/div.kt -include-runtime -d div.jar && java -jar div.jar"
test_impl "Scala" "source ~/.sdkman/bin/sdkman-init.sh && scalac languages/div.scala && scala Division"

echo "--- .NET Languages ---"
test_impl "C#" "dotnet run --project <(cat <<EOF
<Project Sdk=\"Microsoft.NET.Sdk\">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net6.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include=\"languages/div.cs\" />
  </ItemGroup>
</Project>
EOF
)"

echo "--- Functional Languages ---"
test_impl "Haskell" "ghc languages/div.hs -o div_hs && ./div_hs"
test_impl "OCaml" "ocamlc languages/div.ml -o div_ml && ./div_ml"

echo "--- Modern Languages ---"
test_impl "Swift" "swift languages/div.swift"

echo "--- Esoteric Languages ---"
test_impl "Brainfuck" "bf languages/div.bf"

echo
echo "=== Test Summary ==="
echo "All tests completed. Results saved to results/test_results.txt"
echo
echo "--- Results Preview ---"
cat results/test_results.txt