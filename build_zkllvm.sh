#!/bin/bash

PWD=${PWD}
zkLLVM=${PWD}/zkLLVM
EXAMPLES=${zkLLVM}/examples/rust/examples
FIB=${zkLLVM}/examples/rust/examples

cd $zkLLVM

git checkout feat/eths-grant-1
#git pull --recurse-submodules

echo "Now in zkLLVM"



result=$(rustc -V | grep 1.73)
#result=$(rustc -V | grep zkllvm)
#echo $result
if [ -z "$result" ]; then
    echo "Start install risczero toolchain"
    python3 rslang-installer.py
    rustup override set zkllvm
else
    echo "Default rustc Version is zkklvm"
fi



rustup override set 1.73.0