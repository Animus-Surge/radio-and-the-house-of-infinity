import requests

api_url = "https://api.github.com/repos/Animus-Surge/wofrpg-releases/releases/latest"

r = requests.get(api_url)
if r.status_code != 200:
    print(r.status_code, r.text) 
    quit(-1)

url = r.json()["assets"][0]["browser_download_url"]
r = requests.get(url, stream=True)

if r.status_code == 200:
    raw = r.raw
    #print(raw.data)

    f = open("wofrpg.pck", "wb")
    f.write(raw.data)
    f.close()
    print("Successful")