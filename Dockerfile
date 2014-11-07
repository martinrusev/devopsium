FROM edgium.ubuntu.14
RUN git clone -b master https://github.com/martinrusev/edgium.git
RUN ansible-playbook edgium/apps/apache/main.yml -i edgium/hosts
CMD ["/bin/bash"]