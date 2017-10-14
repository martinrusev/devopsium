# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define "main", primary: true do |node|
        node.vm.box = "ubuntu/xenial64"
        #node.vm.box = "debian/jessie64"
        #node.vm.box = "debian/wheezy64"
        # node.vm.box = "bento/centos-7.2"
        #node.vm.box = "bento/centos-6.7"

        node.vm.provision "ansible" do |ansible|
            ansible.playbook = "test.yml"
            ansible.become = true
            ansible.extra_vars = {
                ansible_python_interpreter: "/usr/bin/python3"
            }
            #ansible.verbose = "vvv"
        end
    end

end