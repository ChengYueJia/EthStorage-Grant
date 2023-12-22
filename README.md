# EthStorage-Grant



## Profiler Features
* dry_run
  execute 'fib.wasm' by the inner`wasmi runtime`.

* gen_witness
  generate the witness with`fib.wasm`.

* gen_proof
  generate the proof

### timing profile

* N=1000

| Time(s)              | dry_run | gen_witness | gen_proof | 
|----------------------|---------|-------------|-----------|
| zkWasm(CPU)          | 1.301   | -           | -         |             
| zkWasm(GPU)          | 1.231   | -           | -         | 
| rics0(zkgo/wasm)     | 616     | -           | -         | 
| rics0(zkgo/wasm) GPU | -       | -           | -         | 
| rics0(raw_wasm)      | 0.069   | -           | 112.329   |             
| rics0(raw_wasm) GPU  | -       | -           | 16.808    |
| rics0(riscv)         | 0.38    |             | 8.370     |             
| rics0(riscv) GPU     | -       | -           | 1.395     | 






* N=10000

| Time(s)              | dry_run | gen_witness | gen_proof | 
|----------------------|---------|-------------|-----------|
| zkWasm(CPU)          | -       | -           | -         |             
| zkWasm(GPU)          | -       | -           | -         | 
| rics0(zkgo/wasm)     | -       | -           | -         | 
| rics0(zkgo/wasm) GPU | -       | -           | -         | 
| rics0(raw_wasm)      | -       | -           | -         |                 
| rics0(raw_wasm) GPU  | -       | -           | -         |    
| rics0(riscv)         |         |             | -         |             
| rics0(riscv) GPU     | -       | -           | -         | 


* N=100000

| Time(s)              | dry_run | gen_witness | gen_proof | 
|----------------------|---------|-------------|-----------|
| zkWasm(CPU)          | 1.378   | -           | -         |             
| zkWasm(GPU)          | 1.257   | -           | -         | 
| rics0(zkgo/wasm)     | -       | -           | -         | 
| rics0(zkgo/wasm) GPU | -       | -           | -         | 
| rics0(raw_wasm)      | -       | -           | -         |             
| rics0(raw_wasm) GPU  | -       | -           | -         |
| rics0(riscv)         |         |             | -         |             
| rics0(riscv) GPU     | -       | -           | -         | 



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