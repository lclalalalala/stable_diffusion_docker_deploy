# FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04
# WORKDIR /app
# COPY ./start.sh /app/start.sh
# ENV TZ=Asia/Shanghai
# RUN rm /etc/apt/sources.list.d/*
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN apt-get update && apt-get install -y git wget curl \
#         ffmpeg libsm6 libxext6 python3-opencv
#         # software-properties-common
# # RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y python3.10 python3-pip
# # RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
# # RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
# # RUN update-alternatives --set python3 /usr/bin/python3.10
# RUN wget -O /app/Miniconda_py310.sh https://repo.anaconda.com/miniconda/Miniconda3-py310_23.5.2-0-Linux-x86_64.sh \
#     && bash /app/Miniconda_py310.sh -b \
#     && rm /app/Miniconda_py310.sh
# ENV PATH="/root/miniconda3/bin:${PATH}"
# RUN /root/miniconda3/bin/conda init bash
# RUN git clone --depth 1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /app/stable-diffusion-webui && rm -rf /app/stable-diffusion-webui/models
# EXPOSE 7860
# ENTRYPOINT  [ "/bin/bash","/app/start.sh" ]



# Stage 1: Install Miniconda and Python 3.10
FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04 AS builder
RUN apt-get update && apt-get install -y git wget curl \
        ffmpeg libsm6 libxext6 python3-opencv
RUN wget -O /app/Miniconda_py310.sh https://repo.anaconda.com/miniconda/Miniconda3-py310_23.5.2-0-Linux-x86_64.sh \
    && bash /app/Miniconda_py310.sh -b \
    && rm /app/Miniconda_py310.sh
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN /root/miniconda3/bin/conda init bash

# Stage 2: Clone the repository
FROM builder AS repo-cloner
RUN git clone --depth 1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /app/stable-diffusion-webui
#  && rm -rf /app/stable-diffusion-webui/models

# Stage 3: Final stage
FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04
COPY --from=repo-cloner /app/stable-diffusion-webui /app/stable-diffusion-webui
EXPOSE 7860
# Add the start script as the entry point
ENTRYPOINT [ "/bin/bash", "/app/start.sh" ]