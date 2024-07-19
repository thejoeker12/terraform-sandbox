import sys
sys.path.append("/Users/joseph/Github/jamfpi")

# from ..jamfpi import jamfpi
import jamfpi
from pycookiecheat import chrome_cookies
import logging
from pprint import pprint

EXCLUDE_STRING = "tf-ghatest"


def getCurrentIngressCookie():
    cookies = chrome_cookies("https://lbgsandbox.jamfcloud.com")
    if len(cookies) != 0:
        ingress_cookie = cookies["jpro-ingress"]
        return ingress_cookie
    
    return ""


def new_jamf_client() -> jamfpi.JamfTenant:
    """Returns new jamf client using auth from file """
    config = jamfpi.import_json("clientauth.json")

    client = jamfpi.init_client(
        tenant_name="lbgsandbox",
        client_id=config["clientId"],
        client_secret=config["clientSecret"],
        logging_level=logging.INFO
    )

    cookieVal = getCurrentIngressCookie()
    if cookieVal != "":
        print("cookies found")
        client.classic._session.cookies.set(name="jpro-ingress", value=cookieVal)
    return client


def delete_all_policies(client: jamfpi.JamfTenant, exclude):
    all_policies = client.classic.policies.get_all()

    if all_policies.ok:
        all_json = all_policies.json()["policies"]
    else:
        raise Exception("problem")
    
    for p in all_json:
        if str(p["id"]) not in exclude or EXCLUDE_STRING in p["name"]:
            delete = client.classic.policies.delete_by_id(p["id"])
            if delete.ok:
                print(f"Deleted {p['id']} successfully")


def delete_all_computer_groups(client: jamfpi.JamfTenant, exclude: list):
    all_resources = client.classic.computergroups.get_all()

    if all_resources.ok:
        resource_json = all_resources.json()["computer_groups"]
    else:
        raise Exception("problem")
    
    for i in resource_json:
        if str(i["id"]) not in exclude or EXCLUDE_STRING in i["name"]:
            delete = client.classic.computergroups.delete_by_id(i["id"])
            if delete.ok:
                print(f"Deleted {i['id']} successfully")
            else:
                print(f"problem with {i['id']}, skipping...")


def delete_all_categories(client: jamfpi.JamfTenant, exclude: list):
    all_resources = client.classic.categories.get_all()

    if all_resources.ok:
        resource_json = all_resources.json()["categories"]
    else:
        raise Exception("problem")
    
    for i in resource_json:
        if str(i["id"]) not in exclude or EXCLUDE_STRING in i["name"]:
            delete = client.classic.categories.delete_by_id(i["id"])
            if delete.ok:
                print(f"Deleted {i['id']} successfully")
            else:
                print(f"problem with {i['id']}, skipping...{delete.text}")


def execute(client):
    excluded_policies = []
    excluded_computer_groups = ["1", "2"]
    # print("deleting computer groups...")
    delete_all_computer_groups(client, excluded_computer_groups)
    # print("deleting policies...")
    delete_all_policies(client, excluded_policies)
    # print("complete")
    delete_all_categories(client, [5])

def main():
    client = new_jamf_client()
    execute(client)

main()