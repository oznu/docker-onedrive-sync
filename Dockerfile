FROM ubuntu
MAINTAINER Jimmy Koo<kukkiz@gmail.com>

RUN apt-get update
#RUN apt-get -y install libcurl4-gnutls-dev
#RUN apt-get -y install libcurl4-nss-dev
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get -y install gcc xdg-utils unzip
RUN apt-get -y install libsqlite3-dev

RUN wget http://downloads.dlang.org/releases/2.x/2.071.1/dmd_2.071.1-0_amd64.deb -O dmd.deb && dpkg -i dmd.deb

ADD ./onedrive.conf /usr/local/etc/onedrive.conf

VOLUME ['/usr/local/etc/onedrive.conf', '/onedrive']

ENTRYPOINT ['onedrive', '-m']
