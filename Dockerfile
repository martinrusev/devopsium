FROM edgium.centos.6
ADD apps /edgium/apps
ADD hosts /edgium/hosts
RUN ansible-playbook edgium/apps/mariadb/main.yml -i edgium/hosts
CMD ["/bin/bash"]