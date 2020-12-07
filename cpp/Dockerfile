FROM registry/vim

MAINTAINER Tom Nicholson "https://github.com/tomssem/"

# CPP
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update --fix-missing
RUN apt install gcc-8 g++-8 gcc-9 g++-9 gcc-10 g++-10 -y

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10

## setup YouCompleteMe for C-like languages
RUN /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

CMD ["/bin/bash"]
