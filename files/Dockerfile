FROM ubuntu:12.04

ADD .sources.list /etc/apt/sources.list
RUN apt-get update -y

# Create user vagrant with password vagrant
RUN apt-get install -y zsh
RUN useradd -G adm,root -m -s /bin/zsh -d /home/vagrant vagrant
RUN echo vagrant:vagrant | chpasswd
RUN apt-get install -y sudo
RUN echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
RUN echo "Defaults:vagrant  !requiretty" >> /etc/sudoers.d/vagrant
RUN chmod 0440 /etc/sudoers.d/vagrant

# Set up ssh access
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt-get install -y git
