# Koha Made Simple



Koha-made-simple is a way to start a test server locally with Koha of your choice. It's intended for use as a dev or testing platform and not for production. 



This container does not work with Mac Silicon M1. Any intel machine will work. I have not tested it on an AMD processor, but I am sure it will work fine.



You can make Koha-made-simple work with M1 Mac if you uncomment platform: "linux/amd64" under koha service in the docker-compose.yml file. Docker will now emulate intel, but it's **extremely** slow. I do not recommend it.



### Install the required programs

- macOS:
  - Install brew (https://brew.sh)
  - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  - brew update && brew install git

- Windows
  - Windows users can download Docker + GUI from https://www.docker.com/get-started
  - Git - https://learn.microsoft.com/en-us/devops/develop/git/install-and-set-up-git
- Linux:
  - Instructions for the most popular distros: https://docs.docker.com/desktop/install/linux-install/
  - Install Git. 



### Clone and install Koha-made-simple

- git clone https://github.com/diff3/Koha-Made-Simple

- cd Koha-Made-Simple

- You can change the Koha Instance name and MariaDB password from the .env file. The default username and password is root:pwd

- starting:

  - Run i background: **docker-compose up -d**

  - Run in the terminal. Koha will shutdown after you close the window: 

    **docker-compose up**

  - check names with **docker ps**
  - you can also run **docker logs koha** to see status

- Wait for 10-20m so the installation process can complete



### Post-install

- When done, open **localhost** for OPAC, and **localhost:8080** for admin interface with your favorite browser

- Login to admin interface is **admin:admin**



### Custom database

Koha-made-simple uses a default database. If you want to use your own database, install Koha, do your configurations and dump the database. Remember to remove any users from the borrower's field. 

Name it koha_template.sql in the Koha-made-simple root folder.


You can also edit koha_template.sql but don't change the instance name. It will break the system. Instead, use the .env file for this.



### Remove it/ stop

Ok, you're done. Type **docker-compose down** in the Koha-made-simple root folder. It will shut down and remove any containers related to koha. 



You can also use **docker-compose stop** if you want to use it again. 



Windows users can stop and remove containers with Docker GUI.
