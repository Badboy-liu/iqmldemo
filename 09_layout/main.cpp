//
// Created by zql on 2026/4/8.
//


#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "constant.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    initVcpkgRuntimeEnv(engine);
    engine.loadFromModule("App", "Main");
    return app.exec();
}