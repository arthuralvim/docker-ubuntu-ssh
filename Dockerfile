# Ubuntu:latest + SSH
#
# VERSION               0.1

FROM ubuntu:latest
MAINTAINER Arthur Alvim <afmalvim@gmail.com>

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN locale-gen en_US en_US.UTF-8
RUN apt-get update
RUN apt-get install -y lsb-release
RUN apt-get install -y openssh-server
RUN apt-get install -y supervisor
RUN apt-get install -y build-essential

# make /var/run/sshd
RUN mkdir /var/run/sshd

# copy supervisor conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# set root password
RUN echo "root:root" | chpasswd

# clean packages
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# expose port
EXPOSE 22

# start supervisor
CMD ["/usr/bin/supervisord"]
