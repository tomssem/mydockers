FROM tfwnicholson/base

MAINTAINER Tom Nicholson "https://github.com/tomssem/"

ARG NPROC

RUN echo "nproc: $NPROC"

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

# Install things related to C++
RUN apt-get install doxygen gdb -y

ADD ycm_extra_conf.py /root/.ycm_extra_conf.py

# Install boost
RUN wget https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.gz
RUN tar -xzvf boost_1_75_0.tar.gz
RUN cd boost_1_75_0 && ./bootstrap.sh && ./b2 -j${NPROC} && ./b2 --with=all -j ${NPROC} install

run rm -r boost*

CMD ["/bin/bash"]
