#!/bin/bash
# Colonizer install script.
set -e
logfile="colonizer-install.log"

# Set up a named pipe for logging
npipe=/tmp/$$.tmp
mknod $npipe p

# Log all output to a log for error checking
tee <$npipe $logfile &
exec 1>&-
exec 1>$npipe 2>&1
trap "rm -f $npipe" EXIT

function file_exists() {
    [ -f "$1" ]
}

DISTRO=
if file_exists /etc/debian_version ; then
    DISTRO='debian'
elif file_exists /etc/system-release; then
    DISTRO='rpm'
fi


function on_error() {
    printf "\033[31m
It looks like you hit an issue when trying to install Falcon.

Troubleshooting and basic usage information for Falcon are available at:

    https://colonizer.amon.cx

If you're still having problems, please send an email to martin@amon.cx
with the contents of colonizer-install.log and we'll do our very best to help you
solve your problem.\n\033[0m\n"
}
trap on_error ERR

# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi



function install() {
   
    # Install the necessary package sources
    if [ $DISTRO == 'rpm' ]; then
        echo -e "\033[34m\n* Installing YUM sources for Colonizer\n\033[0m"
        $sudo_cmd sh -c "echo -e '[amon]\nname = Amon.\nbaseurl = http://packages.amon.cx/rpm/\nenabled=1\ngpgcheck=0\npriority=1' > /etc/yum.repos.d/amon.repo"

        printf "\033[34m* Installing the Colonizer package\n\033[0m\n"

        $sudo_cmd yum -y install colonizer
      
    elif [ $DISTRO == 'debian' ]; then
        printf "\033[34m\n* Installing APT package sources for Colonizer\n\033[0m\n"
        $sudo_cmd sh -c "echo 'deb http://packages.amon.cx/repo amon contrib' > /etc/apt/sources.list.d/amonagent.list"
        $sudo_cmd apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv AD53961F

        printf "\033[34m\n* Installing the Colonizer package\n\033[0m\n"
        $sudo_cmd apt-get install -y --force-yes python-software-properties software-properties-common
        $sudo_cmd apt-add-repository -y ppa:ansible/ansible
       
        $sudo_cmd apt-get update
        $sudo_cmd apt-get install -y --force-yes colonizer

    else
        printf "\033[31mYour OS or distribution are not supported by this install script.
    Please follow the instructions on the Colonizer setup page:

        http://colonizer.amon.cx\033[0m\n"
        exit;
    fi


}

function install_ansible(){
    
    printf "\033[34m\n* Installing Ansible ...\n\033[0m\n"

    if [ $DISTRO == 'debian' ]; then
        $sudo_cmd apt-get install -y ansible

    elif [ $DISTRO == 'rpm' ]; then

        $sudo_cmd sh -c "curl -L http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm | rpm -Uvh epel-release-6*.rpm"
        $sudo_cmd yum -y install ansible
    fi
}


# Show a message about where to go for help.
function print_troubleshooting_instructions() {


printf "\033[32m All done. 
   ----------------------------------
   
    To install a package with Falcon
        
        colonizer install package


\033[0m"


}


install
install_ansible
print_troubleshooting_instructions
