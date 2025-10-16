import os
import jamfpy
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

CLIENT = jamfpy.init_client(
    "lbgsandbox",
    client_id=os.environ.get("jamfpro_client_id"),
    client_secret=os.environ.get("jamfpro_client_secret")
)

scripts = CLIENT.pro.scripts.get_all()
resp = scripts[0]
if not resp.ok:
    exit(1)

json_data = resp.json()

for i in json_data["results"]:
    sid = i["id"]
    print(CLIENT.pro.scripts.delete_by_id(sid))


cats = CLIENT.classic.categories.get_all()
print(cats.json())
if not cats.ok:
    exit(1)

for i in cats.json()["categories"]:
    cid = i["id"]
    print(CLIENT.classic.categories.delete_by_id(cid))