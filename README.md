# ₊𐙚⟡˚ AIT Match © 2024 ˚ʚ♡ɞ˚
- **By : Tatiya Seehatrakul st124875**
- This project is developed to fulfill the requirements of the AT70.25 Full Stack Application Development course at the Asian Institute of Technology (AIT) for the August 2024 semester.

## Pre-requisites 
- Docker, Ruby, Rails, Postgresql
- Build docker images : `docker-compose build`
- Create docker container : `docker-compose up` `docker-compose up -d`
- Stop and remove docker container : `docker-compose down`

## Database Server
- Start Database server : `cd db` `docker compose up -d`
- Local Database server : http://localhost:8333
- Production Database server : 

## Rails application
- Start rails server `cd app` `docker compose build` `docker compose up -d`
- Local Rails server : http://localhost:3333
- Production Rails server :

## Docker Container
- Access container to use rails command : `docker exec -it match_web bash`
- Exit container : `exit`


