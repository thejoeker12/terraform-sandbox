#!/bin/sh

bash modupdate.sh
bash compile.sh
rm terraform.tfstate
python3 remove_all_scripts.py