FROM ubuntu:14.04

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

# Set up basic env
RUN ln -s /mnt/repo /home/vagrant/repo
RUN ln -s /mnt/.private /home/vagrant/.private
RUN mkdir /home/vagrant/.ssh
RUN chown vagrant:vagrant /home/vagrant/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmWyPUgH07g2B9pbdNtf3LWWd6meQT5K8yk9VBIZbHjhU1SyP0SQxbbAAebAT2K2DmIsdBmR3nfHWhpGuZyxds/mhnOrX2rnBmdUVEPKKPHWohmfTN11FsPfTFGY9AzTOuVTTI1gcoVLrmXyLJay4uPa2kXtF2TtvqyeQB0iVTPmk9afJIYPQ9r2o++wLucay94zS3/9DenCsSoZw2Mt2NAz+25h7765cJqWjMRkL6BinZD+r9IBe/7y1hmj86fSQHzxVyE+AR/gdNsl38TujLPibfU0pOho4oGfONvtnT4/ZT2C8/8H2FdrL6cY5ww1JKptSQxl65vinnyTEMMwsH dirlt@ubuntu" >> /home/vagrant/.ssh/authorized_keys
RUN chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

# Install basic packages
RUN apt-get install -y git
