import requests
from pprint import pprint

def main():
    token = "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiMjk3MWU5YTctNTIzZS00ZGUzLTk5NDEtN2MwZTcyMTcwNTIzIiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIzIiwiZXhwIjoxNzIzMTE3ODUwfQ.ppW9yF3njRst_3y3KDvo89onI8wBhEmsSfQmKUp5bb0"
    headers = {
        # "accept": "application/json",
        "accept": "text/xml",
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}"
    }


    url = "https://lbgsandbox.jamfcloud.com/JSSResource/policies/id/0"
    target_fn = "out_policy.xml"
    body = open(f"/Users/joseph/github/terraform-sandbox/go_testing/{target_fn}", "r")
    xml = body.read()
    print(xml)
    req = requests.request(method="POST", headers=headers, url=url, data=xml)
    print(req)
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