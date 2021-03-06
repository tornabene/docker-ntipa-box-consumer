# NTIPA-CONSUMER-VERSION 0.0.1
FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>
RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install vim git zip bzip2 fontconfig curl
RUN apt-get -y install ghostscript
RUN apt-get -y install graphicsmagick
RUN apt-get -y install graphicsmagick-imagemagick-compat
RUN apt-get -y install checkinstall
RUN apt-get -y install autoconf automake libtool
RUN apt-get -y install libjpeg62-dev
RUN apt-get -y install libtiff5
RUN apt-get -y install libgs-dev
RUN apt-get -y install tesseract-ocr-ita
RUN apt-get -y install libhocr0
RUN apt-get -y install ruby
RUN apt-get -y install libreoffice

WORKDIR /opt

RUN git clone https://github.com/dagwieers/unoconv 
WORKDIR unoconv
RUN make install

RUN git clone https://github.com/gkovacs/pdfocr.git
WORKDIR pdfocr
RUN ln -s /tmp/pdfocr/pdfocr.rb /usr/bin/pdfocr

 
WORKDIR /etc/supervisor/conf.d
ADD unoconv.conf  /etc/supervisor/conf.d/unoconv.conf
ADD ntipaboxconsumer.conf  /etc/supervisor/conf.d/ntipaboxconsumer.conf

WORKDIR /opt
RUN mkdir devpublic
WORKDIR /opt/devpublic
RUN wget http://tweb2.ipublic.it/nexus/service/local/repositories/ipublic/content/snapshots/com/ipublic/ntipa/ntipa-box-consumer/0.0.1-SNAPSHOT/ntipa-box-consumer-0.0.1-20141023.090124-4.war -O /opt/devpublic/ntipa-box-consumer-0.0.1-SNAPSHOT.war

 

# expose the SSHD port, and run SSHD
EXPOSE 22
EXPOSE 8080
EXPOSE 2002
CMD ["/usr/bin/supervisord"]
