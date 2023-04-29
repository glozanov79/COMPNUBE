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
sudo apt-get install lxd-installer -y
newgrp lxd
lxd init --auto
sudo apt update
sudo apt install haproxy -y
sudo systemctl enable haproxy
<< 'Comment'
vim /etc/haproxy/haproxy.cfg
backend web-backend
    balance roundrobin
    stats enable
    stats auth admin:admin
    stats uri /haproxy?stats
    server web1 192.168.100.4:80 check
    server web2 192.168.100.5:80 check
    server web3 192.168.100.6:80 check
frontend http
    bind *:80
    default_backend web-backend
Comment
systemctl start haproxy
