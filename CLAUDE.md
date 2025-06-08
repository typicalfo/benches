# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a performance benchmarking project comparing Go and Rust implementations of a simple division function with error handling. The goal is to benchmark these implementations over large numbers of iterations and generate output suitable for sharing on social media.

## Architecture

The project contains functionally equivalent implementations across multiple programming languages:

**Popular Languages:**
- `languages/div.go`: Go implementation using standard error handling with `error` interface
- `languages/div.rs`: Rust implementation using custom error type implementing `Error` trait
- `languages/div.js`: JavaScript implementation using custom Error class and try/catch
- `languages/div.py`: Python implementation using custom Exception class
- `languages/div.java`: Java implementation using custom Exception class
- `languages/div.cpp`: C++ implementation using custom exception class inheriting from std::runtime_error
- `languages/div.c`: C implementation using enum return codes and output parameters
- `languages/div.cs`: C# implementation using custom Exception class

**Additional Languages:**
- `languages/div.hs`: Haskell implementation using Either type for error handling
- `languages/div.ml`: OCaml implementation using exceptions
- `languages/div.rb`: Ruby implementation using custom StandardError class
- `languages/div.lua`: Lua implementation using pcall for error handling
- `languages/div.swift`: Swift implementation using enum Error and do-catch
- `languages/div.kt`: Kotlin implementation using custom Exception class
- `languages/div.scala`: Scala implementation using Try/Success/Failure pattern
- `languages/div.pl`: Perl implementation using custom error objects and eval
- `languages/div.php`: PHP implementation using custom Exception class
- `languages/div.bf`: Brainfuck implementation (simplified demonstration)

**Systems Programming Languages:**
- `languages/div.d`: D language implementation using custom exception classes
- `languages/div.zig`: Zig implementation using error unions and explicit error handling
- `languages/div.v`: V lang implementation using option types and error propagation
- `languages/div.odin`: Odin implementation using enum-based error codes and multiple return values

**High-Performance Runtimes:**
- `languages/div_jit.lua`: LuaJIT implementation using FFI for performance optimization
- `languages/div_bun.ts`: TypeScript implementation optimized for Bun runtime
- `languages/div_bun.js`: JavaScript implementation optimized for Bun runtime

All implementations:
- Define a division function that returns an error for division by zero
- Include a main function that demonstrates error handling
- Use idiomatic error handling patterns for their respective languages

## Common Commands

### Option 1: Local Testing (requires installed toolchains)

#### Running the implementations
```bash
# Go
go run languages/div.go

# Rust
rustc languages/div.rs -o div_rust && ./div_rust

# JavaScript (Node.js)
node languages/div.js

# Python
python3 languages/div.py

# Java
javac languages/div.java && java div

# C++
g++ languages/div.cpp -o div_cpp && ./div_cpp

# C
gcc languages/div.c -o div_c && ./div_c

# C# (with .NET)
dotnet run --project languages/div.cs

# Haskell
ghc languages/div.hs -o div_hs && ./div_hs

# OCaml
ocamlc languages/div.ml -o div_ml && ./div_ml

# Ruby
ruby languages/div.rb

# Lua
lua languages/div.lua

# LuaJIT
luajit languages/div_jit.lua

# Swift
swift languages/div.swift

# Kotlin
kotlinc languages/div.kt -include-runtime -d div.jar && java -jar div.jar

# Scala
scalac languages/div.scala && scala Division

# Perl
perl languages/div.pl

# PHP
php languages/div.php

# D
gdc languages/div.d -o div_d && ./div_d

# Zig
zig run languages/div.zig

# V
v run languages/div.v

# Odin
odin run languages/div.odin -file

# TypeScript (Bun)
bun run languages/div_bun.ts

# JavaScript (Bun)
bun run languages/div_bun.js

# Brainfuck (requires bf interpreter)
bf languages/div.bf
```

#### Building optimized binaries for benchmarking
```bash
# Go
go build -o div_go languages/div.go

# Rust
rustc -O languages/div.rs -o div_rust

# C++
g++ -O3 languages/div.cpp -o div_cpp

# C
gcc -O3 languages/div.c -o div_c

# Haskell
ghc -O2 languages/div.hs -o div_hs

# D
gdc -O3 languages/div.d -o div_d

# Zig
zig build-exe languages/div.zig -O ReleaseFast

# V
v -prod languages/div.v -o div_v

# Odin
odin build languages/div.odin -file -opt:3
```

### Option 2: Docker Testing (recommended for complete coverage)

Docker provides a consistent environment with all toolchains pre-installed, enabling testing of all language implementations regardless of local setup.

#### Prerequisites
- Docker and Docker Compose installed

#### Run all tests
```bash
# Build and run all language tests
cd docker
docker-compose up --build

# Run tests with output to console
docker-compose up --build multi-lang-test

# Clean up after testing
docker-compose down
```

#### Individual language testing (debug mode)
```bash
cd docker

# Test specific languages individually
docker-compose --profile debug up go-test
docker-compose --profile debug up rust-test
docker-compose --profile debug up node-test
docker-compose --profile debug up python-test

# Clean up
docker-compose --profile debug down
```

#### View results
```bash
# Results are saved to docker/results/test_results.txt
cat docker/results/test_results.txt
```

#### Docker advantages
- ✅ Tests all 24+ language implementations
- ✅ Consistent environment across different machines
- ✅ No need to install multiple language toolchains locally
- ✅ Reproducible results for benchmarking
- ✅ Easy CI/CD integration

## Development Notes

This project demonstrates cross-language performance comparison for basic error handling operations. When working with benchmarking code, ensure all implementations remain functionally equivalent while using idiomatic patterns for their respective languages. The implementations showcase different error handling paradigms:

- **Exception-based**: JavaScript, Python, Java, C++, C#, OCaml, Ruby, Swift, Kotlin, Scala, Perl, PHP
- **Return values**: Go, C, Lua
- **Algebraic types**: Rust (Result), Haskell (Either), Scala (Try)
- **Esoteric**: Brainfuck (demonstration only)