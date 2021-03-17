FROM tfwnicholson/cpp

MAINTAINER Tom Nicholson "https://github.com/tomssem/"

# basics
RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get update --fix-missing
RUN apt-get install -y python3-dev && apt-get update --fix-missing && apt-get upgrade -y

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

RUN pip install pylint autopep8 flake8

# Jedi autocompleter always crashes IPython
RUN pip uninstall jedi --yes
