FROM registry/python

MAINTAINER Tom Nicholson "https://github.com/tomssem/"


RUN apt-get update --fix-missing && add-apt-repository ppa:jonathonf/vim && apt-get update --fix-missing && apt-get install vim -y && apt-get update --fix-missing && apt-get upgrade -y

RUN echo `vim --version`

# Vim stuff
ADD vimrc /root/.vimrc
## vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
## nice colours
RUN mkdir -p /root/.vim/colors && git clone https://github.com/NLKNguyen/papercolor-theme.git /tmp/theme1 && mv /tmp/theme1/colors/* /root/.vim/colors/.
## install plugins
RUN vim +PluginInstall +qall

CMD ["/bin/bash"]
