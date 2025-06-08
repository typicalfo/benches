# Multi-language testing container
FROM ubuntu:22.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install base tools and package managers
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install language runtimes and compilers
RUN apt-get update && apt-get install -y \
    # C/C++
    gcc \
    g++ \
    # Go
    golang-go \
    # Rust
    rustc \
    # JavaScript/Node.js
    nodejs \
    npm \
    # Python
    python3 \
    python3-pip \
    # Java
    openjdk-17-jdk \
    # C#/.NET
    dotnet-sdk-6.0 \
    # Ruby
    ruby \
    # Lua
    lua5.3 \
    luajit \
    # Perl
    perl \
    # PHP
    php-cli \
    # Swift (requires special handling)
    # Haskell
    ghc \
    # OCaml
    ocaml \
    # D language
    gdc \
    # Kotlin (installed via snap or manual)
    # Scala (requires Java, installed separately)
    && rm -rf /var/lib/apt/lists/*

# Install Kotlin
RUN curl -s https://get.sdkman.io | bash && \
    bash -c "source ~/.sdkman/bin/sdkman-init.sh && sdk install kotlin"

# Install Scala
RUN curl -s https://get.sdkman.io | bash && \
    bash -c "source ~/.sdkman/bin/sdkman-init.sh && sdk install scala"

# Install Swift (Linux version)
RUN wget https://download.swift.org/swift-5.9-release/ubuntu2204/swift-5.9-RELEASE/swift-5.9-RELEASE-ubuntu22.04.tar.gz && \
    tar xzf swift-5.9-RELEASE-ubuntu22.04.tar.gz && \
    mv swift-5.9-RELEASE-ubuntu22.04 /opt/swift && \
    ln -s /opt/swift/usr/bin/swift /usr/local/bin/swift && \
    ln -s /opt/swift/usr/bin/swiftc /usr/local/bin/swiftc && \
    rm swift-5.9-RELEASE-ubuntu22.04.tar.gz

# Install Brainfuck interpreter
RUN apt-get update && apt-get install -y bf && rm -rf /var/lib/apt/lists/*

# Install Zig
RUN wget https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.1856+94c63f31f.tar.xz && \
    tar xf zig-linux-x86_64-0.12.0-dev.1856+94c63f31f.tar.xz && \
    mv zig-linux-x86_64-0.12.0-dev.1856+94c63f31f /opt/zig && \
    ln -s /opt/zig/zig /usr/local/bin/zig && \
    rm zig-linux-x86_64-0.12.0-dev.1856+94c63f31f.tar.xz

# Install V lang
RUN git clone https://github.com/vlang/v && \
    cd v && make && \
    ln -s /workspace/v/v /usr/local/bin/v

# Install Odin
RUN git clone https://github.com/odin-lang/Odin && \
    cd Odin && make release && \
    ln -s /workspace/Odin/odin /usr/local/bin/odin

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash && \
    ln -s /root/.bun/bin/bun /usr/local/bin/bun

# Set up working directory
WORKDIR /workspace

# Copy source files
COPY ../languages/ ./languages/

# Add SDKMAN to PATH for Kotlin/Scala
ENV PATH="/root/.sdkman/candidates/kotlin/current/bin:/root/.sdkman/candidates/scala/current/bin:$PATH"

# Create test script
COPY test-all.sh ./
RUN chmod +x test-all.sh

CMD ["./test-all.sh"]