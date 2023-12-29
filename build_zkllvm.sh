#!/bin/bash

PWD=${PWD}
zkLLVM=${PWD}/zkLLVM
EXAMPLES=${zkLLVM}/examples/
RUST_EXAMPLES=${zkLLVM}/examples/rust/examples
FIB=${zkLLVM}/examples/rust/examples

cd $zkLLVM

git checkout feat/eths-grant-1
#git pull --recurse-submodules
echo "Now in zkLLVM"


result=$(rustc -V | grep 1.73)
#result=$(rustc -V | grep zkllvm)
#echo $result
if [ -z "$result" ]; then
  echo -e "\n==Set Rustc Version to zkklvm"
    python3 rslang-installer.py
    rustup override set zkllvm
else
    echo "Rustc Version is zkklvm"
fi






cd $EXAMPLES
./copy_artifacts.sh


cd $RUST_EXAMPLES
cargo run --release --examples sha2_256 -- --nocapture




#echo -e "\n==Rustc Version is 1.73.0"
#rustup override set 1.73.0