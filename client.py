import requests

pload = {'url_key':'raneevahijab.id'}


receive = requests.post('http://localhost:8000/', data = pload)
print(receive.text)

receive = requests.get('http://localhost:8000/')
print(receive.text)




