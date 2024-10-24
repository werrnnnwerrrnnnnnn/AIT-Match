# ₊𐙚⟡˚ AIT Match © 2024 ˚ʚ♡ɞ˚
- **By : Tatiya Seehatrakul st124875**


- This project is developed to fulfill the requirements of the AT70.25 Full Stack Application Development course at the Asian Institute of Technology (AIT) for the August 2024 semester.
- Admin account 
    - Email :
    - Password :

## Pre-requisites 
- Docker, Ruby, Rails, Postgresql
- Build docker images : `docker-compose build`
- Create docker container : `docker-compose up` `docker-compose up -d`
- Stop and remove docker container : `docker-compose down`

## Database Server
- Start database server : `cd db` `docker compose up -d`
- Local database server : http://localhost:8333
    - pgAdmin account
        - email : admin@admin.<area>com
        - password : password
    - database 
        - name : match_development
        - username : admin
        - password : password
- Production database server : http://192.41.170.201:8333/

## Rails Application Server
- Start rails server `cd app` `docker compose build` `docker compose up -d`
- Local rails server : http://localhost:3333
- Production rails server : http://192.41.170.201:3333/

## Docker Container
- Access container to use rails command : `docker exec -it match_web bash`
- Exit container : `exit`


