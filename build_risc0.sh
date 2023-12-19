#!/bin/bash

PWD=${PWD}
RISC0=${PWD}/risc0/
ZKWASM=${PWD}/risc0/examples/wasm
#ZKWASMCLI=${PWD}/bin/risc0
#ZKWASMCLI=${PWD}/risc0/examples/target/release/wasm
#delphinus_cli=$ZKWASM/target/release/delphinus-cli
#delphinus_cli=${PWD}/bin/delphinus-cli #can't move it out.
FIB_WASM=${PWD}/data/fib_with_input.wasm

cd $RISC0
#git reset --hard v0.19.1

cd $ZKWASM

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


# 2. build and run
echo -e "\n==build risc0"
time RUST_LOG=info cargo run --release -- -w $FIB_WASM

# check cuda
echo -e "\n==build risc0_cuda"
if command -v nvcc >/dev/null 2>&1; then
    echo "nvcc installed"
    time RUST_LOG=info cargo run --release --features cuda -- -w $FIB_WASM
else
    echo "nvcc not installed"
fi


#if [ -f "$ZKWASMCLI" ]; then
#    echo "==$ZKWASMCLI exists."
#else
#    echo "==$ZKWASMCLI does not exist."
#    cargo clean
#    cargo build --release
##    mv ../target/release/wasm $ZKWASMCLI
#fi
#
#./$ZKWASMCLI


# 2. run with wasmi

# 3. generate witness

# 4. generate proof

echo "Finish build_risc0"