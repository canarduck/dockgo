# Pull base image
FROM debian:jessie

# Update & install packages
RUN apt-get update \
  && apt-get install -y \
    python3-pip \
    python3-dev \
    python-wheel \
    libpq-dev \
    postgresql-client \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    xvfb \
    iceweasel \
    g++ \
    build-essential
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /usr/share/locale/* \
  && rm -rf /var/cache/debconf/*-old \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /usr/share/doc/*

# Virtualenv de jessie (1.11) n'utilise pas wheel, j'install par pip (1.15)
RUN pip3 install virtualenv
