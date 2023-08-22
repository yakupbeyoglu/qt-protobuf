QT = core

CONFIG += c++11 cmdline

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \

system(./build_protobuf.sh)

unix:!macx: LIBS += -L$$PWD/proto/ -lprotoc

INCLUDEPATH += $$PWD/proto
DEPENDPATH += $$PWD/proto

# Import shared libraries
unix:!macx: PRE_TARGETDEPS += $$PWD/proto/libprotoc.a $$PWD/proto/libprotobuf.a
unix:!macx: LIBS += -L$$PWD/proto/ -lprotobuf

INCLUDEPATH += $$PWD/proto
DEPENDPATH += $$PWD/proto


SOURCES += \
    proto/message.pb.cc

HEADERS +=  \  # Add the generated pb.h file to headers
    proto/message.pb.h


# Define the path to the Protocol Buffers build directory
PROTOBUF_BUILD_DIR = ./protobuf_source/build

# Add include paths for Protocol Buffersf
INCLUDEPATH += $$PROTOBUF_BUILD_DIR/




