FROM tfwnicholson/vim

MAINTAINER Tom Nicholson "https://github.com/tomssem/"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get install usbutils udev -y

RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/master/scripts/get-platformio.py)"

RUN mkdir -p /etc/udev/rules.d
RUN curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | tee /etc/udev/rules.d/99-platformio-udev.rules
RUN service udev restart
RUN usermod -a -G dialout root
RUN usermod -a -G plugdev root

ENV PATH=$PATH:/root/.platformio/penv/bin

RUN pio platform install atmelavr --with-all-packages

CMD ["/bin/bash"]
