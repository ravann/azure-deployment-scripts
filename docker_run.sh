set -x
docker stop apmi
docker rm apmi

wd=`pwd`

# Run the docker in background 
docker run -d --name apmi \
-v $wd/scripts:/scripts \
apmi-img

