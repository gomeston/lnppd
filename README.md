# LNPPD
## Linux, Nginx, PHP, PostgreSQL and Docker

---

## How to use this
This is a base project to help developers set up their development environment. It is fully possible to customize, adding or removing new containers to suit your needs.
When adding new DBMS containers, you can use its name as a prefix to the settings in the `.env` file, for example: `MYSQL_USER=root`

If you need, you can use this in production, but is necessary special setup in: `php.ini`, `000-default.conf`, `Dockerfile` and `docker-compose`, check respective documentation for more information. 

## How to run it
```bash
docker-compose up --build -d  # build and run
docker-compose ps             # Show current dir containers status
docker-compose down --remove  # down

docker exec -it <conainer_id> /bin/bash # open container bash cli
```

## How to access app
Open [http://170.25.0.9](http://170.25.0.9) in your browser.

## Troubleshooting 
File permission error when run, for example laravel `atisan` create to anything inside container.
Outside container run bellow:
```bash
sudo chown -R $USER: .
```
