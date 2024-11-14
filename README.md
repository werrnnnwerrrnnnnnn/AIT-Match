# ₊𐙚⟡˚ AIT Match © 2024 ˚ʚ♡ɞ˚
- **By : Tatiya Seehatrakul st124875**
- This project is developed to fulfill the requirements of the AT70.25 Full Stack Application Development course at the Asian Institute of Technology (AIT) for the August 2024 semester.

## 📍 Welcome to AIT Match !
🌏💬 AIT Match is a welcoming platform exclusively for AIT students to connect academically and socially, whether you’re looking for new friends, study partners, or even a dating connection! Designed with both academic and social needs in mind, AIT Match makes it easy, safe, and enjoyable to explore the AIT community and form meaningful connections. 🎓💘

## 📍 Pre-requisites 
- Docker, Ruby, Rails, Postgresql

## 📍 Database Server
- Start database server : `cd db` `docker compose up -d`
    - pgAdmin account
        - email : admin@admin.<area>com
        - password : password
    - database 
        - name : match_development
        - username : admin
        - password : password
- Local database server : http://localhost:8333
- Production database server : http://192.41.170.201:8333/

## 📍 Rails Application Server
- Start rails server : `cd app` `docker compose build` `docker compose up -d`
- Local rails server : http://localhost:3333
- Production rails server : http://192.41.170.201:3333/
- Admin account located at : `app/db/seeds.rb`
    - Email : st123456@ait.<area>asia
    - Password : admin123456

## 📍 Docker Container
- Basic Docker Commands
    - Build docker images : `docker-compose build`
    - Create docker container : `docker-compose up` `docker-compose up -d`
    - Stop and remove docker container : `docker-compose down`
    - Access container to use rails command : `docker exec -it match_web bash`
    - Exit container : `exit`
- Docker Container in Production
    - Remove Container: `sudo docker rm <container_ID>` 
    - Remove Images: `sudo docker rmi <image_ID>`
    - Create Container : `sudo docker compose up` `sudo docker compose up --build`