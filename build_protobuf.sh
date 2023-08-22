#!/bin/bash

PROTOBUF_SOURCE_DIR=./protobuf_source
PROTOBUF_VERSION=3.18.0
PROTOBUF_CMAKE_DIR=cmake

# Download Protocol Buffers
curl -L -o protobuf.tar.gz https://github.com/protocolbuffers/protobuf/archive/refs/tags/v$PROTOBUF_VERSION.tar.gz
tar -xzvf protobuf.tar.gz
mv protobuf-3.18.0 $PROTOBUF_SOURCE_DIR

# Build Protocol Buffers
mkdir -p $PROTOBUF_SOURCE_DIR/build
cd $PROTOBUF_SOURCE_DIR/build
cmake ../$PROTOBUF_CMAKE_DIR -Dprotobuf_BUILD_TESTS=OFF
make -j8
echo "PROTO VERSION :"
./protoc --version

pwd
QT_PROJECT_BUILD_DIR=../../build/
PROTO_LIB=../../proto

cp ../../message.proto .
# Create the Qt project build directory if it doesn't exist
if [ ! -d "$PROTO_LIB" ]; then
    mkdir -p "$PROTO_LIB"
fi

./protoc message.proto --cpp_out=$PROTO_LIB
ls $QT_PROJECT_BUILD_DIR
# Create the Qt project build directory if it doesn't exist
if [ ! -d "$QT_PROJECT_BUILD_DIR" ]; then
    mkdir -p "$QT_PROJECT_BUILD_DIR"
fi

# Copy artifacts to Qt build directory
cp -R ../src/* $QT_PROJECT_BUILD_DIR
