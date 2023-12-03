# EthStorage-Grant

## Steps

1. generate `fib.wasm` by zkGo

* [ ]  build the execute binary `zkGo`
* [ ]  compile `fib_go.go` with `zkGo` into `fib.wasm`

2. timing profile


| Task        | zkWasm | rics0 | Desc                                                                                       |
| ----------- | ------ | ----- | ------------------------------------------------------------------------------------------ |
| dry_run     | TODO   | TODO  | execute 'fib.wasm' by the inner`wasm runtime`<br />. To see the wasm witness generate time |
| gen_witness | TODO   | TODO  | generate the witness with`fib.wasm`                                                        |
| gen_proof   | TODO   | TODO  | generate the proof                                                                         |
