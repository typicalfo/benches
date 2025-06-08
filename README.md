# Cross-Language Performance Benchmark

A comprehensive performance comparison across 17+ programming languages, inspired by an X (Twitter) post comparing Go and Rust error handling implementations.

This project was generated entirely using Claude Code with Claude 4 Opus. It has not been evaluated by experts in any of the languages. If you find errors, please submit a PR!

Keep in mind, this is a single test case with results from a single machine. This repo proves nothing, unless you need to know how efficiently different languages perform 100 million division ops on your local machine.

![Original Post](post.png)

> **Project by [@typicalfo](https://x.com/typicalfo)** • [Original Response Tweet](https://x.com/typicalfo/status/1931195695123345408)

## 🚀 Overview

This project benchmarks functionally equivalent division functions with error handling across multiple programming languages to compare performance characteristics and idiomatic patterns. Each implementation handles division by zero using the language's recommended error handling approach.

## 📊 Languages Covered

**Popular Languages:**
- 🐹 **Go** - Error interface pattern
- 🦀 **Rust** - Result<T, E> pattern  
- 🟨 **JavaScript** - Try/catch with custom Error
- 🐍 **Python** - Custom Exception classes
- ☕ **Java** - Exception handling
- ⚡ **C++** - Exception classes with std::runtime_error
- 🔧 **C** - Return codes with output parameters
- 💜 **C#** - Exception handling with custom classes

**Additional Languages:**
- 🎭 **Haskell** - Either type for functional error handling
- 🐪 **OCaml** - Exception-based error handling
- 💎 **Ruby** - StandardError inheritance
- 🌙 **Lua** - pcall error handling
- 🍎 **Swift** - Error protocol with do-catch
- 🏗️ **Kotlin** - Exception handling (JVM-based)
- 🎯 **Scala** - Try/Success/Failure pattern
- 🐪 **Perl** - eval-based error handling
- 🐘 **PHP** - Exception classes
- 🧠 **Brainfuck** - Esoteric demonstration

## 🏃‍♂️ Quick Start

### Option 1: Docker (Recommended)

Test all languages with zero setup:

```bash
cd docker
docker-compose up --build
```

View results:
```bash
cat docker/results/test_results.txt
```

### Option 2: Local Development

Requires individual language toolchains. See [CLAUDE.md](CLAUDE.md) for detailed setup instructions.

```bash
# Example: Go
go run div.go

# Example: Rust  
cargo run --bin main
```

## 🔧 Architecture

Each implementation follows the same pattern:
1. **Division function** that returns appropriate error for division by zero
2. **Error handling** using language-specific idiomatic patterns
3. **Main function** demonstrating both success and error cases
4. **Consistent behavior** across all languages

## 🎯 Benchmarking

The project includes benchmarking tools to measure:
- **Execution time** across iterations
- **Memory usage** patterns
- **Error handling overhead**
- **Language-specific optimizations**

Run benchmarks:
```bash
./run_benchmark.sh
```

## 📈 Results

Performance characteristics vary significantly across languages due to:
- **Compilation vs interpretation**
- **Error handling mechanisms** (exceptions vs return values)
- **Runtime optimizations**
- **Memory management** strategies

## 🤝 Contributing

This project demonstrates cross-language patterns. When contributing:
- Maintain functional equivalence across implementations
- Use idiomatic error handling for each language
- Ensure consistent behavior and output
- Update benchmarks for new languages

## 📝 License

Open source project for educational and benchmarking purposes.

---

*Inspired by the ongoing discussion about programming language performance and error handling patterns in the developer community.*

**Credits:**
- Original concept from [@kai_fall](https://x.com/kai_fall)'s X post comparing Go vs Rust
- Implementation and expansion by [@typicalfo](https://x.com/typicalfo) using Claude Code w/ Claude Opus 4
- Community contributions welcome!
