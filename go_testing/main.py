import requests
from pprint import pprint

def main():
    url = "https://lbgsandbox.jamfcloud.com/api/v1/app-installers/titles"
    token = "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiMTQxZTgyYjctODZkZS00M2ExLThjMGYtNGE5MGM3MTBhMzNhIiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIzIiwiZXhwIjoxNzIyNTI2NjgwfQ.rGMousnyeiOEVinBmEEZmwfzjDN6ghxdwB6V3QWIEG8"
    headers = {
        "accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}"
    }

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
    req = requests.request("GET", url="https://lbgsandbox.jamfcloud.com/JSSResource/policies/id/22", headers=headers)
    print(req)
    if req.ok:
        pprint(req.json())


main()