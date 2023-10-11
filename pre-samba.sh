#!/bin/bash
read ip
read net
read broad
read gw
read dns1
read dns2

# instalar o comando vim para editar os textos

apt-get install vim

# configurar a interface de  rede com o IP estatico para o servidor:
echo "[+] Configurando interface de rede para o IP  estatico"
cat > /etc/network/interfaces <<EOF
allow-hotplug enp1s0
    iface enp1s0 inet static 
    address $ip
    network $net
    netmask $mask
    broadcast $broad
    gateway $gw
    dns-nameservers $dns1 $dns2
EOF

# Mudar o hostname da maquina 

vim /etc/hostname 

# 4* editar o arquivo hosts  

vim /etc/hosts 

# 5* configurar o resolv.conf com os  IPs do dns do servidor e o segundo dns #Arquivo usado para resolver os enderecos IPs do servidor DNS da propria maquina
echo "[+] Configurando o resolv.conf com os  IPs do dns do servidor e o segundo dns"
cat > /etc/resolv.conf <<EOF
nameserver $dns1
nameserver $dns2
EOF

reboot 

