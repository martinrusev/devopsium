FROM edgium.debian.7

RUN git clone -b master https://github.com/martinrusev/edgium.git
RUN ansible-playbook edgium/apps/mongodb/main.yml -i edgium/hosts


CMD ["/bin/bash"]