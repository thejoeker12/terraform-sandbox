
import random as r 
new_name = f"TF Policy Test {r.randint(1, 999999)}"

with open("policy_name.txt", "w") as file:
    file.write(new_name)


