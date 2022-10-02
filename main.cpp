#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <string>
#include <iostream>
#include <windows.h>
#include <stdlib.h>
#include <mv_fileinfo.h>
#include <config.h>
#include "handlestring.h"
using namespace std;

int main(int argc, char *argv[])
{
    //setlocale(LC_ALL,"rus");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    QQmlContext *ctx = engine.rootContext();
    HandleString handleString;
    ctx->setContextProperty("handleString", &handleString);
    //argv[1] = "C:\\Users\\CEO\\Downloads\\влас.png";
    QString strCount = argv[1];
    QString rplStr = QString::fromLocal8Bit(argv[1],strCount.length());
    QString hndlStr = handleString.replace(rplStr,"\\\\","/");
    ctx->setContextProperty("files", hndlStr);


    MV_FileInfo fileInfo;
    ctx->setContextProperty("fileInfo", &fileInfo);

    Config config;
    ctx->setContextProperty("config", &config);

    engine.load(url);
    return app.exec();
}
