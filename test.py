import requests
import json

URL = "http://localhost:4000/api/users"

user = {"name": "latachz", "rfid_uid": 1234}

r = requests.post(url=URL, headers={"Content-Type": "application/json"}, json={
    'user': {
        'name': name,
        'rfid_uid': id
    }
}) 


print(r.status_code)

data = r.text
print(data) 