# Quick setup guide
1. Prepare a virtual environment of your choice - venv/virtualenv/virtualenvwrapper/pyenv
1. I used python version 3.9.9, but it shouldn't matter much, no walruses were harmed in this project
1. Activate the environment, from the project folder run pip install -r requirements.txt
1. Get mongo running
    - Local docker
        1. Start docker
        1. run make prepare_mongo
            - run make start_mongo if it's not the first time you're doing this
    - Something else
        - Make sure to set correct MONGO_URI in app/config.py
        - Catalogue requires text index for search, so make sure it's created: db.songs.createIndex({'artist': 'text', 'title': 'text'})
1. flask run - and you're good to go!
1. for running tests, simply call pytest
