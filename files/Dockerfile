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
RUN mkdir -p /var/run/sshd

# Set up basic env
RUN apt-get install -y git

USER vagrant
env USER vagrant
env HOME /home/vagrant
WORKDIR /home/vagrant
RUN ln -s /mnt/repo repo
RUN ln -s /mnt/.private .private
RUN mkdir -p .ssh
RUN echo ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key > .ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmWyPUgH07g2B9pbdNtf3LWWd6meQT5K8yk9VBIZbHjhU1SyP0SQxbbAAebAT2K2DmIsdBmR3nfHWhpGuZyxds/mhnOrX2rnBmdUVEPKKPHWohmfTN11FsPfTFGY9AzTOuVTTI1gcoVLrmXyLJay4uPa2kXtF2TtvqyeQB0iVTPmk9afJIYPQ9r2o++wLucay94zS3/9DenCsSoZw2Mt2NAz+25h7765cJqWjMRkL6BinZD+r9IBe/7y1hmj86fSQHzxVyE+AR/gdNsl38TujLPibfU0pOho4oGfONvtnT4/ZT2C8/8H2FdrL6cY5ww1JKptSQxl65vinnyTEMMwsH dirlt@ubuntu" >> .ssh/authorized_keys
ADD .shrc  /home/vagrant/.shrc
RUN /bin/zsh -c "source /home/vagrant/.shrc && install_files"

# Install basic packages
USER root
RUN apt-get install -y bzr git subversion
RUN apt-get install -y rsync lsof gdb valgrind
RUN apt-get install -y autotools-dev automake build-essential libtool
RUN apt-get install -y libmysqlclient-dev libaio1
