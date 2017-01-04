FROM ubuntu

RUN apt-get update
RUN apt-get -y install libcurl4-openssl-dev libsqlite3-dev wget gcc unzip make

RUN wget http://downloads.dlang.org/releases/2.x/2.072.2/dmd_2.072.2-0_amd64.deb -O dmd.deb && dpkg -i dmd.deb

RUN wget https://github.com/skilion/onedrive/archive/master.zip && unzip master.zip
RUN cd onedrive-master && make && make install

VOLUME ["/usr/local/etc/my_onedrive.conf", "/onedrive"]

RUN mkdir /root/.config

ADD ./onedrive.conf /root/.config/
ADD ./entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]

CMD ["/usr/local/bin/onedrive", "-m"]
