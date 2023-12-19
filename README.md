# EthStorage-Grant

## Steps

### generate `fib.wasm` by zkGo

* [ ]  build the execute binary `zkGo`
* [ ]  compile `fib_go.go` with `zkGo` into `fib.wasm`

* timing profile


| Task/Time(s) | zkWasm(CPU) | zkWasm(GPU) | rics0  | Desc                                           |
|--------------|-------------|-------------|--------|------------------------------------------------|
| dry_run      | 1.378       | 0.002       | TODO   | execute 'fib.wasm' by the inner`wasmi runtime` |
| gen_witness  | TODO        |             | TODO   | generate the witness with`fib.wasm`            |
| gen_proof    | TODO        |             | TODO   | generate the proof                             |


### generate `fib.risc` by zkGo
> TODO



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
# TODO

```


## Reference
https://github.com/ethstorage/Ethstorage-Grant