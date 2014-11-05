
![](logo_with_text.png)

Edgium
======


Edgium is a lightweight devops package that syncs your sources.list/yum repos with the official or most popular community repository for your favorite apps.


## Why

Most of the time the packages available in our Distros are hopelesly outdated. The only way we can install the latest version is to dig deep into wikis/docs and than execute a lot of similar commands. It gets really painful when you have to repeat the process on multiple servers. If you have the time and knowledge - you can automate that process with Bash scripts, Chef, Puppet, Ansible, etc. These are all great tools in their own right, but sometimes you just want to install the latest PostgreSQL or Nginx and you want to do it as fast as possible. This is where Edgium comes in.

Visit [edgium.amon.cx](edgium.amon.cx) to learn more.


## Quickstart 


	curl http://edgium.amon.cx/install.sh | bash