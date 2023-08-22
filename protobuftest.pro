QT = core

CONFIG += c++11 cmdline

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \

system(./build_protobuf.sh)

SOURCES += \
    proto/message.pb.cc


# Define the path to the Protocol Buffers build directory
PROTOBUF_BUILD_DIR = ./protobuf_source/build

# Add include paths for Protocol Buffers
INCLUDEPATH += $$PROTOBUF_BUILD_DIR/include

# Add the Protocol Buffers libraries
LIBS += -L$$PROTOBUF_BUILD_DIR/lib -lprotobuf -pthread

HEADERS += proto/pb.h \  # Add the generated pb.h file to headers
    proto/message.pb.h
