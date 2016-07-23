FROM ubuntu
MAINTAINER Jimmy Koo<kukkiz@gmail.com>

RUN apt-get update
#RUN apt-get -y install libcurl4-gnutls-dev
#RUN apt-get -y install libcurl4-nss-dev
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get -y install gcc xdg-utils unzip make wget
RUN apt-get -y install libsqlite3-dev

RUN wget http://downloads.dlang.org/releases/2.x/2.071.1/dmd_2.071.1-0_amd64.deb -O dmd.deb && dpkg -i dmd.deb

RUN wget https://github.com/skilion/onedrive/archive/master.zip && unzip master.zip

RUN cd onedrive-master && make && make install


VOLUME ["/usr/local/etc/my_onedrive.conf", "/onedrive"]

RUN mkdir $HOME/.config

ADD ./onedrive.conf $HOME/.config/
ADD ./start.sh $HOME/

CMD $HOME/start.sh
