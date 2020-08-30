FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive 

# use mirror
# COPY sources.list /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y wget dmsetup sudo libfuse2 git openssh-server neovim 
# apt-utils 

# Manually download from https://www.veracrypt.fr/en/Downloads.html
# COPY veracrypt-console-1.24-Update4-Ubuntu-20.04-amd64.deb /veracrypt-console-1.24-Update4-Ubuntu-20.04-amd64.deb
RUN dpkg -i /veracrypt-console-1.24-Update4-Ubuntu-20.04-amd64.deb
RUN mkdir /secret && mkdir /crypt && mkdir /data && rm /veracrypt-console-1.24-Update4-Ubuntu-20.04-amd64.deb

# Do what you want to copy any file to container
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
# COPY ~/.ssh/id_rsa.pub /root/.ssh/authorized_keys
# COPY init_key /usr/local/bin/

COPY run.sh /
RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]
