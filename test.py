import requests
import json
import yaml
import dotenv
import os

dotenv.load_dotenv()

api_key = f'{os.getenv("API_TOKEN")}:{os.getenv("API_SECRET")}'
headers = {'Authorization': f'Bearer {api_key}', }

with open('tinycore.yaml', 'r') as file:
    configuration = yaml.safe_load(file)
    data = json.dumps(configuration)
    print(data)

url = f'{os.getenv("API_URL")}/apis/kubevirt.io/v1/namespaces/default/virtualmachineinstances'
response = requests.post(url, json=data, headers=headers, verify=False)

print(response.json())

