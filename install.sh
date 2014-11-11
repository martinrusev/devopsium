#!/bin/bash
# Edgium install script.
set -e
logfile="edgium-install.log"

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

# Basic distro detection
DISTRO=
if file_exists /etc/debian_version ; then
    DISTRO='debian'
elif file_exists /etc/system-release; then
    DISTRO='rpm'
fi

# Proper distro detection - for Ansible
DISTRO_ID=$(
python - <<EOF
import platform ; print platform.dist()[0].lower()
EOF
)

DISTRO_VERSION=$(
python - <<EOF
import platform ; print int(float(platform.dist()[1]))
EOF
)

function on_error() {
    printf "\033[31m
It looks like you hit an issue when trying to install Edgium.

Troubleshooting and documentation for the Edgium are available at:

   http://edgium.amon.cx/#docs

If you're still having problems, please send an email to martin@amon.cx
with the contents of edgium-install.log and we'll do our very best to help you
solve your problem.\n\033[0m\n"
}
trap on_error ERR



# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi



function install_edgium() {
   
    # Install the necessary package sources
    if [ $DISTRO == 'rpm' ]; then
        echo -e "\033[34m\n* Installing YUM sources\n\033[0m"
        $sudo_cmd sh -c "echo -e '[amon]\nname = Amon.\nbaseurl = http://packages.amon.cx/rpm/\nenabled=1\ngpgcheck=0\npriority=1' > /etc/yum.repos.d/amon.repo"

        printf "\033[34m* Installing the Edgium package\n\033[0m\n"

        $sudo_cmd yum -y install edgium
      
    elif [ $DISTRO == 'debian' ]; then
        printf "\033[34m\n* Installing APT package sources for Amon\n\033[0m\n"
        $sudo_cmd sh -c "echo 'deb http://packages.amon.cx/repo amon contrib' > /etc/apt/sources.list.d/amonagent.list"
        $sudo_cmd apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv AD53961F

        printf "\033[34m\n* Installing Edgium \n\033[0m\n"
       
        $sudo_cmd apt-get update
        $sudo_cmd apt-get install -y --force-yes edgium

    else
        printf "\033[31mYour OS or distribution are not supported by this install script.\033[0m\n"
        exit;
    fi



}

function install_ansible(){
    
    printf "\033[34m\n* Installing Ansible ...\n\033[0m\n"
    # Ansible is separated in several repositories, detect the Distro

    if [ $DISTRO == 'debian' ]; then

        if [ $DISTRO_ID == 'ubuntu' ]; then
            $sudo_cmd apt-get install -y --force-yes python-software-properties software-properties-common
            $sudo_cmd apt-add-repository -y ppa:ansible/ansible
            $sudo_cmd apt-get update
            $sudo_cmd apt-get install ansible
        elif [ $DISTRO_ID == 'debian' ]; then

            if [ $DISTRO_VERSION == 7 ]; then
                $sudo_cmd sh -c "echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/backports.list"
                $sudo_cmd apt-get update
                $sudo_cmd apt-get -t wheezy-backports install "ansible"
            else
                $ printf "\033[31mYour OS or distribution are not supported by this install script.\033[0m\n"
                exit;
            fi 
        fi

    elif [ $DISTRO == 'rpm' ]; then
        $sudo_cmd yum install epel-release
        $sudo_cmd yum -y install ansible
    fi
}

# Show a message about where to go for help.
function print_troubleshooting_instructions() {


printf "\033[32m All done.
   ----------------------------------
    
    For troubleshooting instructions, please see the Documentation:

        https://edgium.amon.cx/#docs

   To install a package 
        
        sudo edgium install [package]

\033[0m"


}


install_edgium
install_ansible
print_troubleshooting_instructions