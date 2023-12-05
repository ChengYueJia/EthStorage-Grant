#!/bin/bash
ZKGO=${PWD}/bin/zkgo



if [ -f "$ZKGO" ]; then
    echo "$ZKGO exists."
else
    echo "$ZKGO does not exist."
fi
