set -x
docker stop apmi
docker rm apmi

wd=`pwd`

# Run the docker in background 
docker run -d --name apmi \
-v $wd/azs_apmi_w_func_from_scratch:/azs_apmi_w_func_from_scratch \
apmi-img

