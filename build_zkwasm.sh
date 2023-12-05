#!/bin/bash

PWD=${PWD}
ZKWASM=${PWD}/zkWasm/
ZKWASMCLI=${PWD}/zkWasm/crates/cli/
delphinus_cli=$ZKWASM/target/release/delphinus-cli


# 1. pull zkwasm
echo "==Pull wasmi"
cd $ZKWASM
#git submodule init
#git submodule pull
git submodule update --init --recursive

# 2. build
cargo build --release

# 3. dry run
$delphinus_cli -k 22 --wasm fib_with_input.wasm  --function zkmain dry-run --public 0:i64 --public 1:i64 --public 817770325994397771:i64

