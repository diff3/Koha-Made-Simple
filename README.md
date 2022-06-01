# Koha Made Simple

- does not work with Mac Silicon M1
- I have only tried this on Intel Mac

Install:
- Get docker from: https://www.docker.com/get-started
- MacOS:
  - Install brew (https://brew.sh)
  - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  - brew update && brew install git
- git clone https://github.com/diff3/Koha-Made-Simple
- cd Koha-Made-Simple
- docker-compose up

Wait for everything to be installed. It ends with displaying koha-user and password
open a webbrowser and go to the url

localhost:8080

follow the instructions. Next time you can start koha with docker-compose up -d or from Docker desktop

Opac: localhost

Intra: localhost:8080

You can change instance name and mysql password from .env file
