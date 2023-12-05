help: ## Display this help screen
	@grep -h \
		-E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

pull: ## Pull all the recursive submodule
	@git submodule update --init --recursive



path: ## Export bin to env path.
	@bash export_path.sh



.PHONY: clippy doc fmt test test_benches test-all evm_bench state_bench circuit_benches help
