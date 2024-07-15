#!/bin/bash

# Atualizar Ubuntu para a versão mais recente
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Iniciar Docker no boot
sudo systemctl enable docker
sudo systemctl start docker

# Criar imagem PHP
sudo docker build -t web:latest /vagrant
#websockts
cd /vagrant 
sudo docker build -t websocket_image:latest -f Dockerfilews .

