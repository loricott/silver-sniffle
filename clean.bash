#!/usr/bin/bash
CLIENT_BUILD_DIR=./build_client
SERVER_BUILD_DIR=./build_server

( cd ${CLIENT_BUILD_DIR} && make clean )
( cd ${SERVER_BUILD_DIR} && make clean )

/bin/rm ./*.pem

/bin/rm -r ${CLIENT_BUILD_DIR}
/bin/rm -r ${SERVER_BUILD_DIR}
