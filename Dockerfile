FROM linuxserver/baseimage
MAINTAINER Wes Jackson <icebal.7@gmail.com>
ENV APTLIST="oracle-java8-installer unzip"
#accept the Oracle license to autmate install
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# Install Dependencies
RUN add-apt-repository ppa:webupd8team/java && \
apt-get update && \
apt-get install -qy $APTLIST && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*
#make Ubooquity dir and get latest release
RUN mkdir /app/ubooquity && \
cd /app/ubooquity && \
wget "http://vaemendis.net/ubooquity/service/download.php" -O ubooquity.zip &&\
unzip ubooquity*.zip &&\
rm ubooquity*.zip
#Make font folder to keep Ubooquity from breaking
RUN mkdir -p /etc/service/ubooquity/fonts/
#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh
 
VOLUME ["/downloads", "/ebooks", "/comics"]
EXPOSE 2202