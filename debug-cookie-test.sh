#!/bin/sh
rm logs.txt
touch logs.txt

# rm testing_logs/filteredlogs-apply.txt
# touch testing_logs/filteredlogs-apply.txt

# rm testing_logs/filteredlogs-destroy.txt
# touch testing_logs/filteredlogs-destroy.txt

sh modupdate-rebuild-clear.sh
python3 remove_all_scripts.py


terraform apply -parallelism=10 -auto-approve
grep "load_balancer_workaround.go" logs.txt > filteredlogs-apply.txt
rm logs.txt
touch logs.txt

terraform destroy -parallelism=10 -auto-approve

echo "Beginning delete, output being redirected to testinglogs/logs_tf_output.txt"
# TF_LOG=debug terraform destroy -
# auto-approve > testing_logs/logs_tf_output.txt 2>&1
terraform destroy -parallelism=10 -auto-approve 

# grep "DELETELOG:" testing_logs/logs_tf_output.txt > testing_logs/deletelog.txt


# grep "load_balancer_workaround.go" logs.txt > testing_logs/filteredlogs-destroy.txt