# EthStorage-Grant



## Profiler Features
* dry_run
  execute 'fib.wasm' by the inner`wasmi runtime`.

* gen_witness
  generate the witness with`fib.wasm`.

* gen_proof
  generate the proof

### timing profile

* N=100
> OS: Linux  DISK: 2T   Mem: 512G	AMD EPYC 7532 32-Core Processor  64Core	GPU: 3090

| Time(s)              | dry_run | gen_witness | gen_proof | 
|----------------------|---------|-------------|-----------|
| zkWasm(CPU)          | 1.343   | -           | -         |             
| zkWasm(GPU)          | 1.415   | -           | -         | 
| rics0(zkgo/wasm)     | -       | -           | 0.407     | 
| rics0(zkgo/wasm) GPU | -       | -           | 0.424     | 
| rics0(raw_wasm)      | -       | -           | 0.432     |             
| rics0(raw_wasm) GPU  | -       | -           | 0.464     |
| rics0(riscv)         | -       |             | 0.396     |             
| rics0(riscv) GPU     | -       | -           | 0.405     | 


* N=1000
> OS: Linux  DISK: 2T   Mem: 512G	AMD EPYC 7532 32-Core Processor  64Core	GPU: 3090

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
All the binary file will gather:
1. zkgo
2. zkwasm_cli
3. risc0

### data
All the generated data will be store in `data`:
1. fib_go.wasm


## How to run:
* prepare
```bash
make prepare
```

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
Include `raw_fib_wasm`, `zkgo_fig_wasm`, `raw_fib_risc`: 
```bash
./build_risc0.sh
```


## Reference
https://github.com/ethstorage/Ethstorage-Grant