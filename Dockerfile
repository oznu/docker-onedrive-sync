FROM ubuntu
MAINTAINER Jimmy Koo<kukkiz@gmail.com>

RUN apt-get update
RUN apt-get install libcurl-dev
RUN apt-get install libsqlite3-dev
RUN wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
RUN wget -qO - http://dlang.org/d-keyring.gpg | apt-key add -
RUN apt-get install dmd-bin

ADD ./onedrive.conf /usr/local/etc/onedrive.conf

VOLUME ['/usr/local/etc/onedrive.conf', '/onedrive']

ENTRYPOINT ['onedrive', '-m']
