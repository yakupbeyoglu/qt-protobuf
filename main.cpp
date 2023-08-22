#include <QCoreApplication>
#include <google/protobuf/message.h>
#include "proto/message.pb.h"
#include <qdebug.h>
int main(int argc, char *argv[])
{
    MyMessage message;
    message.set_name("yakup");
    message.set_value(3);
    std::cout << message.name() << std::endl;

    QCoreApplication a(argc, argv);

    return a.exec();
}
