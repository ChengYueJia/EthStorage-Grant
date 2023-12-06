#!/bin/bash

PWD=${PWD}
ZKWASM=${PWD}/zkWasm/
ZKWASMCLI=${PWD}/zkWasm/crates/cli/
#delphinus_cli=$ZKWASM/target/release/delphinus-cli
delphinus_cli=${PWD}/bin/delphinus-cli #can't move it out.

# data
FIB_WASM=${PWD}/data/fib_with_input.wasm


# 2. build
echo "==build zkwasm"
if [ -f "$delphinus_cli" ]; then
    echo "==$delphinus_cli exists."
else
    echo "==$delphinus_cli does not exist."
    cd $ZKWASM
    cargo build --release
    mv $ZKWASM/target/release/delphinus-cli $delphinus_cli
fi

# 3. dry run
echo "==zkwasm dry_run"
time $delphinus_cli -k 22 --wasm $FIB_WASM  --function zkmain dry-run --public 0:i64 --public 1:i64 --public 817770325994397771:i64
#delphinus-cli -k 22 --wasm fib_with_input.wasm  --function zkmain dry-run --public 0:i64 --public 1:i64 --public 817770325994397771:i64


# 3. single_prove: generate wintess
# TODO: meet error.
#echo "==zkwasm single-prove"
#time $delphinus_cli -k 22 --wasm $FIB_WASM  --function zkmain single-prove --public 0:i64 --public 1:i64 --public 817770325994397771:i64

echo "Finish build_zkwasm"