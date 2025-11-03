FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1) base system + python + swig
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    cmake \
    pkg-config \
    git \
    wget \
    ffmpeg \
    libgl1 \
    libglvnd0 \
    libglx0 \
    libegl1 \
    libxext6 \
    libx11-6 \
    x11-apps \
    nano \
    swig \
    && rm -rf /var/lib/apt/lists/*

# 2) python packages (combined into one layer)
# - 'pettingzoo[all]' already includes gymnasium, multi_agent_ale_py, and pygame
#   so we just need to install griddly and autorom alongside it.
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir \
        griddly \
        autorom \
        'pettingzoo[all]'

# 3) Run AutoROM to accept license
RUN AutoROM --accept-license
# if you hit a NumPy mismatch, try:
# RUN pip install --no-cache-dir "numpy<2.0"

# 4) nvidia / gui env (keep from your original)
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=graphics,utility,compute
ENV QT_X11_NO_MITSHM=1

# 5) app location
WORKDIR /app

# (optional) copy your example into the image:
# COPY ./src/Griddly/python/examples/Stochasticity /app
# or just mount it at runtime: -v $(pwd):/app

# 6) default
CMD ["bash"]