FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
WORKDIR /app
ENV TZ=Asia/Shanghai
RUN rm /etc/apt/sources.list.d/*
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y git wget curl \
        ffmpeg libsm6 libxext6 python3-opencv
RUN wget -O /app/Miniconda_py310.sh https://repo.anaconda.com/miniconda/Miniconda3-py310_23.5.2-0-Linux-x86_64.sh
RUN /bin/bash /app/Miniconda_py310.sh -b \
    && rm /app/Miniconda_py310.sh
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN /root/miniconda3/bin/conda init bash
RUN git clone --depth 1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /app/stable-diffusion-webui
#  && rm -rf /app/stable-diffusion-webui/models
COPY ./start.sh /app/start.sh
EXPOSE 7860
CMD [ "/bin/bash", "/app/start.sh" ]