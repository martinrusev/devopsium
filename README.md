
![](logo_with_text.png)

Edgium
======

Install up-to-date Linux packages with 1 line.



## Why Edgium?

The packages available in our Distros are hopelesly outdated. To install the latest 
version we have to dig deep into Wikis, Docs, Stack Overflow
or some random article/tutorial named "How to install X on [Distro of Choice]".
It gets really time consuming and painful when you have to repeat the process.
<br><br>
Edgium combines all this knowledge in one package. 

Visit [http://edgium.amon.cx](http://edgium.amon.cx) to learn more.



## What is Edgium?

Edgium is a small DevOps tool built around Ansible and everything it does is sync
the most popular and regularly updated repository with your 
`yum/repos.d` or `/etc/apt/sources.list.d`. 


Edgium is heavily inspired by <a href="http://brew.sh">homebrew</a> for 
OSX. The major difference is that **EDGIUM IS NOT A PACKAGE MANAGER** -
it uses the underlying package managers(apt, yum).

## Quickstart 


	curl http://edgium.amon.cx/install.sh | bash



## Manual Installation


### Install on Ubuntu/Debian

1. **Import the public key used by the package management system.**
The Ubuntu package management tools (i.e. dpkg and apt) ensure package consistency and authenticity by requiring that distributors sign packages with GPG keys. Issue the following command to import the [https://packages.amon.cx/amon.key]( Edgium public GPG Key):

	

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv AD53961F


2. **Create a list file for Edgium.**
Create the /etc/apt/sources.list.d/edgium.list list file using the following command:



	echo 'deb http://packages.amon.cx/repo amon contrib' | sudo tee /etc/apt/sources.list.d/edgium.list


3. **Reload local package database and install**
Issue the following commands:

	

	sudo apt-get update
	sudo apt-get install edigum



## Available packages

You can see the whole list of available packages here:


[http://edgium.amon.cx/#packages](http://edgium.amon.cx/#packages)
