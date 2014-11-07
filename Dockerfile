FROM edgium.ubuntu.14
RUN git -C /edgium pull
RUN ansible-playbook edgium/apps/nginx/main.yml -i edgium/hosts
CMD ["/bin/bash"]