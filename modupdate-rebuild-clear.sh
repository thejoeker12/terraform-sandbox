#!/bin/sh

sh modupdate.sh
sh compile.sh
rm terraform.tfstate
python3 remove_all_scripts.py