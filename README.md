# Ansible testsystem

This is a test system for Ansible in a container environment. It is a simple
system with a single host container and a single control container. the host
container is a ubi9-init container with systemd and sshd installed and running.
The control container is a ubi9-init container with ansible installed. The
playbooks are mounted in the control container.

## Getting started

Here i will use podman-compose, but you can use docker-compose if you prefer.
Clone the repository and run the following command to start the containers:

```bash
podman-compose up -d
```

## Run ansible playbook

To access the control container, run the following command:

```bash
podman-compose exec ansible-control bash
```

Go to the test playbook directory and run the playbook. The playbook directory
is mounted in the control container at `/home/ansible/playbooks`.

```bash
cd minimal
ansible-playbook -i inventory.ini playbook.yml
```
