FROM ubuntu:bionic-20191029

MAINTAINER Tom Nicholson "https://github.com/tomssem/"


# basics
RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get clean && apt-get autoclean && apt-get update --fix-missing
RUN apt-get install unzip apt-utils curl build-essential wget git software-properties-common tree tmux silversearcher-ag man -y
RUN apt-get update --fix-missing && apt-get upgrade -y

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository https://cli.github.com/packages
RUN apt update --fix-missing
RUN apt install gh -y

# Install cmake
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 291F9FF6FD385783
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DE19EB17684BA42D
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt-get update --fix-missing
RUN apt-get purge --auto-remove cmake
RUN apt-get install cmake -y
RUN cmake --version

# Tmux setup
RUN echo "set -g mouse on" >> ~/.tmux.conf

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]


CMD ["/bin/bash"]
