#!/bin/bash

PWD=${PWD}
zkLLVM=${PWD}/zkLLVM

cd $zkLLVM

git checkout feat/eths-grant-1
git pull --recurse-submodules


echo "in zkLLVM"

# run rust fib.