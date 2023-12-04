#!/bin/bash

PWD=${PWD}
GOROOT=${PWD}/go

echo $PWD
echo $GOROOT

# 1. build zkgo
echo "==Build zkgo"
cd $GOROOT/src
git checkout zkGo # try to remote it.
./all.bash
mv $GOROOT/bin/go $GOROOT/bin/zkgo # The zkgo binary: go/bin/zkgo

## TODO Try to reuse the built zkgo binary file
#export PS4="\$LINENO: "
#set -xv
#FILE1="${@:$OPTIND:1}"         # Line 6
#if [ ! -e "$FILE1" ]           # Line 7
#then
#    echo "requested file doesn't exist" >&2
#    exit 1
#else
#    echo "Found File $FILE1"   # Line 12
#fi



# 2. export zkgo's path
echo "==Export zkgo to path"
export GOPATH=$GOROOT/
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# test zkgo
which zkgo

# 3. compile `fib_go.go` into `fib.wasm`
echo "==Compile fib into wasm with zkgo"
FIB_PATH=$GOROOT/zkgo_examples/fib

GOOS=wasip1 GOARCH=wasm zkgo build -gcflags=all=-d=softfloat -o $FIB_PATH/fib.wasm $FIB_PATH/fib.go
