import requests
from pprint import pprint
import json

def main():
    token = "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiZjk4Yjc5ZWEtYzEzNi00ODA1LThmOWQtMmUyN2E2M2JiNGU3IiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIzIiwiZXhwIjoxNzIzNDU4MDg0fQ.U9bl_i2BA1XOiEz9Gd3bfnSju0PlZmuIC7SQhV1dhQU"
    headers = {
        # "accept": "application/json",
        "accept": "application/json",
        # "Content-Type": "text/xml",
        "Authorization": f"Bearer {token}"
    }


    url = "https://lbgsandbox.jamfcloud.com/api/v1/icon/13"
    resp = requests.request("DELETE", headers=headers, url=url)
    print(resp)
    # target_fn = "out_policy_icon.xml"
    # body = open(f"/Users/joseph/github/terraform-sandbox/go_testing/{target_fn}", "r")
    # xml = body.read()
    # req = requests.request("GET", headers=headers, url=url)
    # print(req)
    # if not req.ok:
    #     print(req.text)

    # with open("out_policy_icon_1.xml", "w") as f:
    #     f.write(req.text)


main()

    # Lists available apps
    # req = requests.request("GET", url=url, headers=headers)
    # if req.ok:
    #     reqJson = req.json()

    # for i in reqJson["results"]:
    #     print(f"{i['id']} - {i['titleName']}")


    # Gets info about app by id
    # req= requests.request("GET", url="https://lbgsandbox.jamfcloud.com/api/v1/app-installers/titles/50F", headers=headers)
    # if req.ok:
    #     reqJson = req.json()
    #     pprint(reqJson)

    # Creates new App
    # json_data = open("/Users/joseph/github/terraform-sandbox/go_testing/payload.json", "r").read()
    # print(json_data)