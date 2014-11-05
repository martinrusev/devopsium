FROM martinrusev/centos:latest


ADD EDGIUM_RPM_FILE var/edgium.rpm

RUN yum -t -y install /var/edgium.rpm

RUN ls -lh /usr/local/edgium/

RUN edgium install boo
RUN edgium update


CMD ["/bin/bash"]