
import random as r 
new_policy_name = f"TF Policy Test {r.randint(1, 999999)}"
new_group_name = f"TF Group Test {r.randint(1, 999999)}"

with open("policy_name.txt", "w") as file:
    file.write(new_policy_name)

with open("group_name.txt", "w") as file:
    file.write(new_group_name)

