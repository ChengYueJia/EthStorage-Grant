# EthStorage-Grant


## Structure

### bin
All the binary file will gather here:
1. zkgo
2. zkwasm_cli
3. risc0

### data
All the generated data will be store here:
1. fib_go.wasm


## How to run:
* pull submodule
```bash
make pull
```

* gen fib.wasm by zkgo
```bash
./build_zkgo.sh
```

* profile zkwasm
```bash
./build_zkwasm.sh
```

* profile rics0
```bash


```