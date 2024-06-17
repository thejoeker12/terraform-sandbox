import requests
from pprint import pprint

def main():
    url = "https://lbgsandbox.jamfcloud.com/api/v1/app-installers/titles"
    token = " eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiMTZiNmFhODgtZjIyZC00OGNiLWI2ZjYtNDg5MWNiMWVhOGY5IiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIzIiwiZXhwIjoxNzE4NjIxNjc2fQ.8zUuQAnjNeciMHWbw_4kV4X1N7alJw43BGWuuFoVEyA"
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
    json_data = open("/Users/joseph/github/terraform-sandbox/go_testing/payload.json", "r").read()
    print(json_data)
    req = requests.request("DELETE", url="https://lbgsandbox.jamfcloud.com/api/v1/app-installers/deployments/3", headers=headers)
    print(req)
    if req.ok:
        print(req.text)


main()