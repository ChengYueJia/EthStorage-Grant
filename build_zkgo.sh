#!/bin/bash

PWD=${PWD}

GOROOT=${PWD}/go
#ZKGO=${PWD}/bin/zkgo #can't move it out.
ZKGO=$GOROOT/bin/zkgo

FIB_PATH=$GOROOT/zkgo_examples/fib/fib_zkgo.go
#FIB_PATH=$GOROOT/data/fib_zkgo.go
FIB_WASM=${PWD}/data/fib_with_input.wasm

GEN_WITNESS=$GOROOT/zkgo_examples/fib/write_witness.py
FIB_INPUT=${PWD}/data/input.dat

WASMI_EXEC_NODE=$GOROOT/zkgo_examples/zkWasm-emulator/wasi/wasi_exec_node.js

# 1. build zkgo
echo "==build zkgo"
if [ -f "$ZKGO" ]; then
    echo "==$ZKGO exists."
else
    echo "$ZKGO does not exist."
    echo "==Build zkgo"
    cd $GOROOT/src
    git fetch
    git checkout zkGo # try to remote it.
    ./all.bash
    mv $GOROOT/bin/go $ZKGO # The zkgo binary: go/bin/zkgo
fi

# 2. export zkgo's path
echo "==Export zkgo to path"
./export_path.sh
which zkgo # test zkgo

# 3. compile `fib_go.go` into `fib.wasm`
echo "==Compile fib_go into fib.wasm by zkgo"
if [ -f "$FIB_WASM" ]; then
    echo "==$FIB_WASM exists."
else
  echo "==Compile fib into wasm with zkgo"
  echo $GOROOT
  cd $GOROOT
  GOOS=wasip1 GOARCH=wasm $ZKGO build -gcflags=all=-d=softfloat -o $FIB_WASM $FIB_PATH
fi

echo "==Compile fib_go into fib.wasm by zkgo"
if [ -f "$FIB_WASM" ]; then
    echo "==$FIB_WASM exists."
else
  echo "==Compile fib into wasm with zkgo"
  echo $GOROOT
  cd $GOROOT
  GOOS=wasip1 GOARCH=wasm $ZKGO build -gcflags=all=-d=softfloat -o $FIB_WASM $FIB_PATH
fi

echo "==Compile gen witness"
if [ -f "$FIB_INPUT" ]; then
    echo "==$FIB_INPUT exists."
else
  echo 0 | python3 $GEN_WITNESS > $FIB_INPUT
  echo 1 | python3 $GEN_WITNESS >> $FIB_INPUT
  echo 817770325994397771 | python3 $GEN_WITNESS >> $FIB_INPUT

  # Require node > 20
  echo "==Compile witness into wasm"
  node $WASMI_EXEC_NODE $FIB_WASM $FIB_INPUT
fi

echo "Finish build_zkgo"