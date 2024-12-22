#!/bin/bash
echo "root:${ROOT_PASSWORD}"
echo "${ANSIBLE_USER}:${ANSIBLE_PASSWORD}"

ssh-keyscan ${ANSIBLE_HOST_ADDRESS} >> ~/.ssh/known_hosts
sshpass -p ${ANSIBLE_PASSWORD} ssh-copy-id -i ~/.ssh/id_rsa.pub ${ANSIBLE_HOST_ADDRESS}
sshpass -p ${ROOT_PASSWORD} ssh "root@${ANSIBLE_HOST_ADDRESS}" 'sed -i "s/^#*PasswordAuthentication.*/PasswordAuthentication no/" /etc/ssh/sshd_config && sed -i "s/^#*UsePAM.*/UsePAM no/" /etc/ssh/sshd_config && sed -i "s/^#*PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config && systemctl restart sshd'
