FROM martinrusev/amonbase:latest

RUN apt-get update
RUN apt-get install -y gdebi-core
ADD edgium_0.2.3_all.deb var/edgium.deb

RUN gdebi -n /var/edgium.deb


RUN ls -lh /usr/local/edgium/
RUN edgium install boo

CMD ["/bin/bash"]