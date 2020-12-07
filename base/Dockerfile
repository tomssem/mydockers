FROM ubuntu:bionic-20191029

MAINTAINER Tom Nicholson "https://github.com/tomssem/"

ARG GIT_NAME
ARG GIT_EMAIL


# basics
RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get update --fix-missing
RUN apt-get install curl build-essential wget git software-properties-common tree tmux -y
RUN git config --global user.name ${GIT_NAME}
RUN git config --global user.email ${GIT_EMAIL}
RUN apt-get update --fix-missing && apt-get upgrade -y

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository https://cli.github.com/packages
RUN apt update --fix-missing
RUN apt install gh -y

# Install cmake
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 291F9FF6FD385783
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt-get update --fix-missing
RUN apt purge --auto-remove cmake
RUN apt-get install cmake -y
RUN cmake --version

# Tmux setup
RUN echo "set -g mouse on" >> ~/.tmux.conf

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]


CMD ["/bin/bash"]
