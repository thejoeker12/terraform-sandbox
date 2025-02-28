#!/bin/sh

rm logs.txt
touch logs.txt

rm filteredlogs-apply.txt
touch filteredlogs-apply.txt

rm filteredlogs-destroy.txt
touch filteredlogs-destroy.txt

sh modupdate-rebuild-clear.sh
python3 remove_all_scripts.py


terraform apply -parallelism=1 -auto-approve
grep "load_balancer_workaround.go" logs.txt > filteredlogs-apply.txt
rm logs.txt
touch logs.txt

terraform destroy -parallelism=1 -auto-approve

grep "load_balancer_workaround.go" logs.txt > filteredlogs-destroy.txt