Easy to deploy stable diffusion webUI on Linux
Prerequisites:
- docker with nvidia runtime
- nvidia gpu driver
- docker compose v2

How to use:

0. Edit .env file and put it at root folder
example:
```
SERVICE_PORT=0.0.0.0:7860
MODEL_PATH=$HOME/sd_models
USER_DATA_PATH=$HOME/sd_user_data
```

1. Buld and run
```
export UID=$(id -u)
export GID=$(id -g)
docker compose up --build -d
```

2. Update the image: rebuild the image again
```
export UID=$(id -u)
export GID=$(id -g)
docker-compose down
docker compose up --build -d
```