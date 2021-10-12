#!/bin/sh
sleep 3
#while ! ping -c 1 -W 2 8.8.8.8; do
#    sleep 1
#    echo waiting for the network
#done
apt update -y
apt install -y sudo openssh-server python3
systemctl enable ssh
systemctl start ssh
useradd {{username}}
gpasswd -a {{username}} sudo
sed -i 's/%sudo.*/%sudo    ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
mkdir -p /home/{{username}}/.ssh
echo "{{ansible_ssh_key}}" >> /home/{{username}}/.ssh/authorized_keys
chown -R {{username}}:{{username}} /home/{{username}}
chmod 700 /home/{{username}}/.ssh

