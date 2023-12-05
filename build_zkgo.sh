#!/bin/bash

PWD=${PWD}

GOROOT=${PWD}/go
#ZKGO=${PWD}/bin/zkgo #can't move it out.
ZKGO=$GOROOT/bin/zkgo

FIB_PATH=$GOROOT/zkgo_examples/fib/fib.go
FIB_WASM=${PWD}/data/fib.wasm


# 1. build zkgo
echo "==build zkgo"
if [ -f "$ZKGO" ]; then
    echo "==$ZKGO exists."
else
    echo "$ZKGO does not exist."
    echo "==Build zkgo"
    cd $GOROOT/src
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

echo "Finish build_zkgo"