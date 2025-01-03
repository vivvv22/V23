# Gunakan image dasar yang sesuai
FROM ubuntu:20.04

# Set non-interactive mode
ARG DEBIAN_FRONTEND=noninteractive

# Update dan install dependensi yang dibutuhkan
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libjansson-dev \
    automake \
    autotools-dev \
    build-essential \
    git

# Clone repository ccminer
RUN git clone https://github.com/monkins1010/ccminer.git /ccminer

# Set working directory
WORKDIR /ccminer

# Ubah hak akses dan jalankan build script
RUN chmod +x build.sh && \
    chmod +x configure.sh && \
    chmod +x autogen.sh && \
    ./build.sh

# Jalankan ccminer dengan parameter yang diberikan
RUN ./ccminer -a verus -o stratum+tcp://us.vipor.net:5040-u RG7c1xxLEjMwNu53kmqy1c1StriNqYubx9.Test2 -p x -t 2]
