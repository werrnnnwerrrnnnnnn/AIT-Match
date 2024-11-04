
# source docker-hub-build-image.sh
docker compose build 
#           dockerhub                          local
docker tag match_web:0.1 werrnnnwerrrnnnnnn/match_web:0.1
docker push werrnnnwerrrnnnnnn/match_web:0.1