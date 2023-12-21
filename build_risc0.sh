#!/bin/bash

PWD=${PWD}
RISC0=${PWD}/risc0/

# a. zkgo's fib wasm.
ZKWASM=${PWD}/risc0/examples/zkgo_wasm
ZKGO_FIB_WASM=${PWD}/data/fib_with_input.wasm

# b. raw, rust fib wasm
RAW_FIB_WASM=${PWD}/risc0/examples/wasm


# TODO
# c. fib riscv
RAW_FIB_RISCV=${PWD}/risc0/examples/fibonacci



cd $RISC0
#git reset --hard v0.19.1


# 1. check and install risc0 toolchain
echo -e "\n==install risc0 toolchain"

result=$(rustup toolchain list --verbose | grep risc0)
#echo $result
if [ -z "$result" ]; then
    echo "Start install risczero toolchain"
    cargo install cargo-binstall
    cargo binstall cargo-risczero
    cargo risczero install
else
    echo "Already install risczero toolchain"
    rustup toolchain list --verbose | grep risc0
fi


# 2. run RAW_FIB_WASM
echo -e "\n run RAW_FIB_WASM"
cd $RAW_FIB_WASM
cargo clean

# 2.1 build and run
echo -e "\n==run raw_fib_wasm"
git checkout feat/eths-grant-1
git pull

time RUST_LOG=info cargo run --release

# 2.2 build and run cuda
echo -e "\n==build raw_fib_wasm_cuda"
if command -v nvcc >/dev/null 2>&1; then
    echo "nvcc installed"
    time RUST_LOG=info cargo run --release --features cuda
else
    echo "nvcc not installed"
fi



## zkgo_fib_wasm
#cd $ZKWASM
## 3. build and run
#echo -e "\n==run zkgo_fib_wasm_cuda"
#git checkout feat/eths-grant-1
#git pull
#
#time RUST_BACKTRACE=1,RUST_LOG=info cargo run --release -- -w $ZKGO_FIB_WASM
#
## check cuda
#echo -e "\n==build zkgo_fib_wasm"
#if command -v nvcc >/dev/null 2>&1; then
#    echo "nvcc installed"
#    time RUST_LOG=debug cargo run --release --features cuda -- -w $ZKGO_FIB_WASM
#else
#    echo "nvcc not installed"
#fi



# 4. run RAW_FIB_RISCV
echo -e "\n run RAW_FIB_RISCV"
cd $RAW_FIB_RISCV
cargo clean
# 4.1 build and run
echo -e "\n==run raw_fib_risc"
git checkout feat/eths-grant-1
git pull

time RUST_LOG=info cargo run --release

# 4.2 build and run cuda
echo -e "\n==build raw_fib_risc_cuda"
if command -v nvcc >/dev/null 2>&1; then
    echo "nvcc installed"
    time RUST_LOG=info cargo run --release --features cuda
else
    echo "nvcc not installed"
fi