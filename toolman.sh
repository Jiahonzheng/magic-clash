#!/bin/bash

function realpath() {
  OURPWD=$PWD
  cd "$(dirname "$1")"
  LINK=$(readlink "$(basename "$1")")
  while [ "$LINK" ]; do
    cd "$(dirname "$LINK")"
    LINK=$(readlink "$(basename "$1")")
  done
  REALPATH="$PWD/$(basename "$1")"
  cd "$OURPWD"
  echo "$REALPATH"
}

set -e
cd "$(dirname $(realpath $0))"

BIN=./bin/magic
CONFIG_DIR=./config
LOG_DIR=./logs
LOG_FILE=${LOG_DIR}/nohup.out
PID_FILE=${LOG_DIR}/pid

function start() {
  mkdir -p ${LOG_DIR}
  nohup ${BIN} -d ${CONFIG_DIR} >&${LOG_FILE} &
  echo $! >${PID_FILE}
  echo "Clash Web Dashboard: https://yacd.haishan.me"
}

function stop() {
  kill -9 $(cat ${PID_FILE})
  rm -f ${PID_FILE}
}

case ${1} in
start)
  start
  ;;
stop)
  stop
  ;;
*)
  echo "Error: Cannot execute \"${1}\" command."
  ;;
esac
