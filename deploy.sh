# stop container
if [ $( docker ps -a | grep sd_container | wc -l ) -gt 0 ]
then
  docker rm -f sd_container
else
  echo "sd_container does not exist"
fi

# remove image
if [ $( docker images | grep sd_image | wc -l ) -gt 0 ]
then
  docker image rm -f sd_image
else
  echo "sd_image does not exist"
fi


# read config
if [ -f config ]
then
  export $(cat config | xargs)
fi

# build image
docker build -t sd_image .

# start container
docker run -d \
    --name sd_container \
    -p $SERVICE_PORT:7860 \
    -v $MODEL_PATH:/app/stable-diffusion-webui/models \
    -v $USER_DATA_PATH:/app/user_data \
    --restart unless-stopped \
    --gpus all \
    sd_image

