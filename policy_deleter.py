import sys
sys.path.append("/Users/joseph/github/jamfpi")

import jamfpi
from pycookiecheat import chrome_cookies
import logging


def getCurrentIngressCookie():
    cookies = chrome_cookies("https://lbgsandbox.jamfcloud.com")
    if len(cookies) != 0:
        ingress_cookie = cookies["jpro-ingress"]
        return ingress_cookie
    
    raise Exception("No cookies found")

def new_jamf_client() -> jamfpi.JamfTenant:
    """Returns new jamf client using auth from file """
    config = jamfpi.import_json("clientauth.json")

    client = jamfpi.init_client(
        tenant_name="lbgsandbox",
        client_id=config["clientId"],
        client_secret=config["clientSecret"],
        logging_level=logging.INFO
    )

    client.classic._session.cookies.set(name="jpro-ingress", value=getCurrentIngressCookie())
    return client


EXCLUDED = ["1029"]
def delete_all(client: jamfpi.JamfTenant):
    """Deletes all policies from jamf instance"""
    all_policies = client.classic.policies.get_all()

    if all_policies.ok:
        all_json = all_policies.json()["policies"]
    else:
        raise Exception("problem")
    
    for p in all_json:
        if str(p["id"]) not in EXCLUDED:
            delete = client.classic.policies.delete_by_id(p["id"])
            if delete.ok:
                print(f"Deleted {p['id']} successfully")


def main():
    delete_all(new_jamf_client())

main()