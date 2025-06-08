# Ansible Playbook : container

A Ansible playbook to show how to use Ansible to setup a few container
and glue them together with a traefik container.

## Prerequisites

* Subdomains for the containers
  * Add the subdomains to your `/etc/hosts` file
    * `127.0.0.1 grafana.containers.internal`

## Run

```bash
ansible-playbook -i inventory/ playbook.yml
```

## Usage

### Grafana

* URL: [http://grafana.containers.internal:8080](http://grafana.containers.internal:8080)
  * admin:admin
