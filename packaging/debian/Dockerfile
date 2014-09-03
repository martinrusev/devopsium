FROM martinrusev/amonbase:latest

RUN apt-get install -y gdebi-core
ADD falcon_0.1_all.deb var/falcon.deb

RUN gdebi -n /var/falcon.deb

RUN falcon install boo

CMD ["/bin/bash"]