echo "executing python script..."
python3 deleter.py
echo "deleting state..."
sh del_state.sh
echo "setting new name..."
python3 set_new_policy_name.py
echo "done"