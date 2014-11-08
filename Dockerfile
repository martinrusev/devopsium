FROM edgium.debian.7
ADD apps /edgium/apps
ADD hosts /edgium/hosts
RUN ansible-playbook edgium/apps/nodejs/main.yml -i edgium/hosts
CMD ["/bin/bash"]