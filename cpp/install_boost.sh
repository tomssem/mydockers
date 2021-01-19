#!/bin/bash

NPROC=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk '{print $NF}'`
BOOST_VERSION=1.75.0
BOOST_FILE=boost_${BOOST_VERSION//\./_}
BOOST_URL=https://dl.bintray.com/boostorg/release/1.75.0/source/${BOOST_FILE}.tar.gz

BOOST_PREPARE_COMMAND=./bootsrap.sh
BOOST_COMPILE_COMMAND=./b2 -j${NPROC}
BOOST_INSTALL_COMMAND=sudo ./b2 --with=all -j ${NPROC} install 

USER_CONFIGFILE=`find $PWD -name user-config.jam`
echo "using mpi ;" >> $USER_CONFIGFILE

wget $BOOST_URL
tar -xzvf ${BOOST_FILE}*
cd ${BOOST_FILE}
$BOOST_PREPARE_COMMAND
$BOOST_COMPILE_COMMAND
$BOOST_INSTALL_COMMAND
