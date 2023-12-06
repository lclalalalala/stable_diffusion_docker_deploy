#!/bin/bash
cd /app/stable-diffusion-webui
python3 launch.py --listen \
    --enable-insecure-extension-access \
    --xformers