#!/bin/bash

rm -r ~/.ebd
rm -r ~/.ebcli

ebd init local --chain-id=peggy

ebcli config chain-id peggy
ebcli config trust-node true
ebcli config indent true
ebcli config output json

# ebcli config keyring-backend file
# (echo '1234567890'; echo '1234567890') | ebcli keys add validator
# (echo '1234567890'; echo '1234567890') | ebcli keys add testuser
# echo '1234567890' | ebd add-genesis-account $(ebcli keys show validator -a) 1000000000stake,1000000000atom

ebcli keys add validator
ebcli keys add testuser
ebd add-genesis-account $(ebcli keys show validator -a) 1000000000stake,1000000000atom

ebd gentx --name validator
ebd collect-gentxs