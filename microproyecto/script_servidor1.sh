#!/bin/bash
echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST
#!------------------------------------------------------------
#!-Aprovicionando la maquina
#!------------------------------------------------------------
echo "Instalamos las herramientas de red"
sudo apt-get install net-tools
echo "Instalamos el gestor vim"
sudo apt-get install vim
echo "Instalamos lynx"
sudo apt-get install lynx -y
echo "Actualizamos los paquetes del sistema"
sudo apt-get update
echo "Instalamos python"
sudo apt install python3-pip -y
#!------------------------------------------------------------
sudo apt install nodejs -y
node -v
sudo apt install npm -y
npm -v
sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/omondragon/consulService
cd consulService/app
npm install consul
npm install express
node index.js 3000
#node index.js 3001