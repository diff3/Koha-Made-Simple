# Koha Made Simple

- does not work with Mac Silicon M1
- I have only tried this on Intel Mac

Install:
- git clone https://github.com/diff3/Koha-Made-Simple
- cd Koha-Made-Simple

docker-compose up

Wait for everything to be installed. It ends with displaying koha-user and password
open a webbrowser and go to the url

localhost:8080

follow the instructions. Next time you can start koha with docker-compose up -d or from Docker desktop

Opac: localhost

Intra: localhost:8080

You can change instance name and mysql password from .env file
