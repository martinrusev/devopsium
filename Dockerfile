FROM edgium.ubuntu.14
ADD apps /edgium/apps
ADD hosts /edgium/hosts
RUN ansible-playbook edgium/apps/git/main.yml -i edgium/hosts
CMD ["/bin/bash"]