docker stop apmi
docker rm apmi
docker rmi apmi-img

docker build --rm -f Dockerfile -t apmi-img:latest .
