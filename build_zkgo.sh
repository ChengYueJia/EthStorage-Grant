#!/bin/bash

PWD=${PWD}

GOROOT=${PWD}/go
#ZKGO=${PWD}/bin/zkgo #can't move it out.
ZKGO=$GOROOT/bin/zkgo

FIB_PATH=$GOROOT/zkgo_examples/fib/fib_zkgo.go
#FIB_PATH=$GOROOT/data/fib_zkgo.go
FIB_WASM=${PWD}/data/fib_with_input.wasm
#FIB_RISCV=${PWD}/data/fib_with_input.rrr #TODO

GEN_WITNESS=$GOROOT/zkgo_examples/fib/write_witness.py
FIB_INPUT=${PWD}/data/input.dat

WASMI_EXEC_NODE=$GOROOT/zkgo_examples/zkWasm-emulator/wasi/wasi_exec_node.js

# 1. build zkgo
echo "==Build zkgo"
if [ -f "$ZKGO" ]; then
    echo -e "==$ZKGO exists. \n"
else
    echo "$ZKGO does not exist."
    cd $GOROOT/src
    git fetch
    git checkout feat/eths-grant-1 # try to remote it.
    ./all.bash
    mv $GOROOT/bin/go $ZKGO # The zkgo binary: go/bin/zkgo
    echo -e "built \n"
fi

# 2. export zkgo's path
#echo "==Export zkgo to path"
#./export_path.sh
#which zkgo # test zkgo

# 3. compile `fib_go.go` into `fib.wasm`
echo -e "\n==Compile fib_go into fib.wasm by zkgo"
if [ -f "$FIB_WASM" ]; then
    echo -e "==$FIB_WASM exists. \n"
else
  echo $GOROOT
  cd $GOROOT
  GOOS=wasip1 GOARCH=wasm $ZKGO build -gcflags=all=-d=softfloat -o $FIB_WASM $FIB_PATH
  echo -e "compiled \n"
fi

#echo "==Compile fib into riscv with zkgo"
#if [ -f "$FIB_RISCV" ]; then
#    echo -e "==$FIB_RISCV exists. \n"
#else
#  echo $GOROOT
#  cd $GOROOT
##  TODO: need to update GOOS with GOARCH.
#  GOOS=linux GOARCH=riscv64 $ZKGO build -gcflags=all=-d=softfloat -o $FIB_RISCV $FIB_PATH
#  echo -e "compiled \n"
#fi

# 4. compile gen witness
echo "==Compile gen witness"
if [ -f "$FIB_INPUT" ]; then
    echo -e "==$FIB_INPUT exists. \n"
else
  echo 0 | python3 $GEN_WITNESS > $FIB_INPUT
  echo 1 | python3 $GEN_WITNESS >> $FIB_INPUT
  echo 817770325994397771 | python3 $GEN_WITNESS >> $FIB_INPUT

  # Require node > 20
  echo -e "==Compile witness into wasm"
  time node $WASMI_EXEC_NODE $FIB_WASM $FIB_INPUT
fi

echo "Finish build_zkgo"