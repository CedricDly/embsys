#! /bin/sh

LD_PRELOAD=../gps/lib/libhook.so ./../gps/bin/gps
SCRIPT=`readlink -f $0`
ROOT_DIR=`dirname $SCRIPT`/../../../gps

export LD_LIBRARY_PATH=$ROOT_DIR/lib
$ROOT_DIR/bin/gps
