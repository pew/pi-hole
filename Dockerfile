FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -y upgrade
RUN apt-get -y remove network-manager
RUN apt-get -y install dnsutils dnsmasq curl
RUN /etc/init.d/dnsmasq stop

COPY dnsmasq.conf /etc/dnsmasq.conf
RUN echo user=root >> /etc/dnsmasq.conf
COPY gravity-adv.sh /usr/local/bin/gravity.sh

RUN chmod +x /usr/local/bin/gravity.sh
RUN /usr/local/bin/gravity.sh

EXPOSE 53/udp
CMD dnsmasq -u root -k -7 /etc/dnsmasq.d/
