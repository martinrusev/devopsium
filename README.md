
![](logo.png)

Devopsium
======

[![Build Status](https://travis-ci.org/martinrusev/devopsium.svg?branch=master)](https://travis-ci.org/martinrusev/devopsium)

Devopsium is an Ansible playbook for rapid dev localhost setup. It gives you the option to install the latest and greatest software from the official repositories
with a couple of lines of code


```bash
ansible-galaxy install martinrusev.devopsium

# vim repository_setup_playbook.yml
- hosts: localhost
  become: yes
  become_user: root
  roles:
    - martinrusev.devopsium
  vars:
    devopsium_repositories:
      - postgresql
      - docker-ce
      - python
      - kubernetes
      - vscode
      
$ ansible-playbook repository_setup_playbook.yml
$ sudo apt install kubectl vscode postgresql-10 docker-ce python3.6 prometheus
```


- [Motivation](#motivation)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Available Repositories](#available-repositories)
  - [DevOps Tools](#devops-tools)
  - [Programming Languages](#programming-languages)
  - [Databases](#databases)
  - [Web Servers](#web-servers)
  - [Text Editors](#text-editors)


## Motivation

The packages available in our Distro are not always up to date with the latest and greatest provided by the software creators.
To install the latest desirable version, we usually go over the following routine:

- We dig into Wikis, official Documentation, StackOverflow and find the officially supported repository
- We create `/etc/apt/sources.list.d/package.list`, `yum/repos.d/package.list` files
- We import repository keys `http://repo.package.com/gpg.key`
- We update our local package cache and install the corresponding package

Devopsium is an Ansible playbook that aims to solve this problem by providing a standardized way to sync your local repos
with the officially maintained by the package creators or the community repositories. 

It is heavily inspired by <a href="https://developers.redhat.com/products/softwarecollections/overview/">Red Hat Sofware Collections</a>

## Requirements

Devopsium requires Ansible 2.2 or higher.


## Installation

To install Devopsium run the following command:

```
ansible-galaxy install martinrusev.devopsium
```

## Usage

```bash
# vim repository_setup_playbook.yml
- hosts: localhost
  become: yes
  become_user: root
  roles:
    - martinrusev.devopsium
  vars:
    devopsium_repositories:
      - postgresql
      - docker-ce
      - python
      - kubernetes
      - vscode
      
$ ansible-playbook repository_setup_playbook.yml
$ sudo apt install kubectl vscode postgresql-10 docker-ce python3.6 prometheus

```

## Available Repositories

### DevOps tools

| Name                   | Packages available for install after sync                      | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| grafana          | `grafana`  | Ubuntu/Debian/RHEL|
| prometheus          | `prometheus` ,`prometheus-alertmanager`, `prometheus-pushgateway`  | Ubuntu/Debian/RHEL|
| docker-ce        | `docker-ce`  | Ubuntu/Debian/RHEL  |
| kubernetes       | `kubelet`, `kubeadm`, `kubectl`  | Ubuntu/Debian/RHEL  |
| jenkins        | `jenkins`  | Ubuntu/Debian/RHEL  |


### Programming Languages

| Name                   | Packages available for install after sync                      | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| python          | `python3.6`  | Ubuntu |
| nodejs8          | `nodejs`  | Ubuntu |

### Databases

| Name                   | Packages available for install after sync                      | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| postgresql       | `postgresql-` `9.2, 9.3, 9.4, 9.5, 9.6, 10`| Ubuntu/Debian  |
| mongodb        | `mongodb-org-server` | Ubuntu/Debian/RHEL  |
| influxdb         | `influxdb`, `telegraf`, `kapacitor`, `chronograf`  | Ubuntu/Debian/RHEL  |
| elasticsearch      | `elasticsearch`, `filebeat`, `metricbeat`, `kibana` | Ubuntu/Debian/RHEL  |

### Web Servers

| Name                   | Packages available for install after sync                      | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| nginx          | `nginx` | Ubuntu/Debian/RHEL  |


### Text Editors

| Name                   | Packages available for install after sync                      | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| sublime-text     | `sublime-text` | Ubuntu/Debian/RHEL  |
| vscode     | `code` | Ubuntu/Debian/RHEL  |



## Repository Setup References

- Grafana - https://packagecloud.io/grafana
- PostgreSQL - https://wiki.postgresql.org/wiki/Apt
- MongoDB -  https://docs.mongodb.com/manual/administration/install-on-linux
- Docker - https://docs.docker.com/engine/installation/linux/docker-ce
- InfluxDB - https://docs.influxdata.com/influxdb/v1.3/introduction/installation
- ElasticSearch - https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html
- Nginx - https://nginx.org/en/linux_packages.html
- Kubernetes - https://kubernetes.io/docs/setup/independent/install-kubeadm/
- Jenkins - https://jenkins.io/download/
- Sublime Text - https://www.sublimetext.com/docs/3/linux_repositories.html
- VSCode - https://code.visualstudio.com/docs/setup/linux
- NodeJS - https://github.com/jtyr/prometheus-deb
- Yarn - https://yarnpkg.com/lang/en/docs/install/
- Prometheus - https://github.com/lest/prometheus-rpm / https://github.com/jtyr/prometheus-deb

## Contributing

If you happen to come accros a bug, please create and issue providing as much information as possible.
If you want to add more packages, please fork the project and submit a Pull Request. All contributions are most welcome.

## License

MIT

## Author Information

Martin Rusev (https://amon.cx)
