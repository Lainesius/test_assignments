import json
import os
import random

import requests
from bs4 import BeautifulSoup


script_dir = os.path.dirname(os.path.abspath(__file__))
saved_data_path = os.path.join(script_dir, 'xkcd_grab.json')
try:
    with open(saved_data_path, 'r') as f:
        saved_data = json.load(f)
except FileNotFoundError:
    saved_data = {}

previous = saved_data.get('previous')
before_previous = saved_data.get('before_previous')

saved_images = filter(None, [previous, before_previous])

archive_response = requests.get('https://xkcd.com/archive/')
if archive_response.status_code == 200:
    archive_soup = BeautifulSoup(archive_response.content, 'html.parser')
    parsed_strips = archive_soup.select('#middleContainer > a')
    available_comics = [comic['href'].replace('/', '') for comic in parsed_strips]
    while True:
        chosen_comic = random.choice(available_comics)
        if chosen_comic not in saved_images:
            break

    strip_page_response = requests.get(f'https://xkcd.com/{chosen_comic}/')
    if strip_page_response.status_code == 200:
        strip_soup = BeautifulSoup(strip_page_response.content, 'html.parser')
        image_url = strip_soup.select('#comic > img')[0]['src']
        image_response = requests.get(f'https:{image_url}')
        if image_response.status_code == 200:
            with open(os.path.join(script_dir, f'{chosen_comic}.png'), 'wb') as save_handler:
                save_handler.write(image_response.content)
                if previous is not None:
                    if before_previous is not None:
                        os.remove(os.path.join(script_dir, f'{before_previous}.png'))
                    saved_data['before_previous'] = previous
                saved_data['previous'] = chosen_comic

                with open(saved_data_path, 'w') as f:
                    json.dump(saved_data, f, indent=4)
