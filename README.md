
![](logo.png)

Devopsium
======

Collection of Ansible playbooks to quickly install up to date Linux packages



## Motivation

The packages available in our Distro are not always up to date with the latest and greatest provided by the software creators.
To install the latest desirable version, we usually go over the following flow:

- We dig into Wikis, official Documentation, StackOverflow and find the officially supported repository
- We create `/etc/apt/sources.list.d/package.list`, `yum/repos.d/package.list` files
- We import repository keys `http://repo.package.com/gpg.key`
- We update our local package cache and install the corresponding package

Devopsium is an Ansible playbook that aims to solve this problem by providing a standardized way to sync your local repos
with the officially maintained by the package creators or the community repositories. 

It is heavily inspired by <a href="http://brew.sh">homebrew</a> for 
OSX. 

## Requirements

Devopsium requires Ansible 2.2 or higher.


## Installation

To install Devopsium run the following command:

```
ansible-galaxy install martinrusev.devopsium
```

## Usage

```
  - hosts: all
    roles:
      - martinrusev.devopsium

    vars:
      devopsium_repositories:
      	- grafana
      	- postgresql
      	- mongodb
      	- docker-ce
```

## Available Repositories


| Name                   | Repo                       | Supported Distros       |
| ---------------------- |:--------------------------:| -----------------------:|
| grafana			     | https://packagecloud.io/grafana | Ubuntu/Debian/RHEL  |
| postgresql			 | https://wiki.postgresql.org/wiki/Apt | Ubuntu/Debian  |
| mongodb			 | https://docs.mongodb.com/manual/administration/install-on-linux/ | Ubuntu/Debian/RHEL  |
| docker-ce			 | https://docs.docker.com/engine/installation/linux/docker-ce | Ubuntu/Debian/RHEL  |

## Contributing

If you happen to come accros a bug, please create and issue providing as much information as possible.
If you want to add more packages, please fork the project and submit a Pull Request. All contributions are most welcome.

## License

MIT

## Author Information

Martin Rusev (https://amon.cx)