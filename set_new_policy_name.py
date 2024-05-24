
import random as r 

new_policy_name = f"TF Policy Test {r.randint(1, 999999)}"
with open("resource_names/policy_name.txt", "w") as file:
    file.write(new_policy_name)

new_group_name = f"TF Group Test {r.randint(1, 999999)}"
with open("resource_names/group_name.txt", "w") as file:
    file.write(new_group_name)

