import requests
from pprint import pprint

def main():
    token = "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiZDY3Yjk5OTMtZjhiZS00MTEyLWEwZjItNjdkMTZlMDJhMDllIiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIzIiwiZXhwIjoxNzIzMTMzNzAzfQ.mX_K-d4x1R92oUbY2SyvzIUpEE3zW7qQBuIoIJWTjZM"
    headers = {
        # "accept": "application/json",
        "accept": "text/xml",
        "Content-Type": "text/xml",
        "Authorization": f"Bearer {token}"
    }


    url = "https://lbgsandbox.jamfcloud.com/JSSResource/policies/id/0"
    target_fn = "policy.xml"
    body = open(f"/Users/joseph/github/terraform-sandbox/go_testing/{target_fn}", "r")
    xml = body.read()
    req = requests.request("POST", headers=headers, url=url, data=xml)
    print(req)
    if not req.ok:
        print(req.text)


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