# EthStorage-Grant

## Steps

1. generate `fib.wasm` by zkGo

* [ ]  build the execute binary `zkGo`
* [ ]  compile `fib_go.go` with `zkGo` into `fib.wasm`

2. timing profile


| Task        | zkWasm | rics0 | Desc                                                                                                       |
| ----------- | ------ | ----- |------------------------------------------------------------------------------------------------------------|
| dry_run     | TODO   | TODO  | execute 'fib.wasm' by the inner`wasm runtime`<br />. To see the wasm witness generate time.                |
| dry_run     | TODO   | TODO  | Risc0, Host function implement, and compile it's risc0 and wasm version.  go_wasm/go_wasm_risc0/rust_risc0 |
| gen_witness | TODO   | TODO  | generate the witness with`fib.wasm`                                                                        |
| gen_proof   | TODO   | TODO  | generate the proof                                                                                         |




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


## Reference
https://github.com/ethstorage/Ethstorage-Grant