.PHONY: deploy-anvil list_scripts

KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# This is the private key of account from the mnemonic from the "make anvil" command
deploy-anvil:
	forge script script/Erc20OpenZeppelin.s.sol --rpc-url http://localhost:8545  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
