//
// Created by loukas on 2026/4/7.
//

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "constant.h"
#include "model/UserViewModel.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    qmlRegisterType<UserPageReq>("App", 1, 0, "UserPageReq");


    QQmlApplicationEngine engine;
    initVcpkgRuntimeEnv(engine);

    UserViewModel* model = new UserViewModel();
    engine.rootContext()->setContextProperty("userVm",model);
    // engine.load(QUrl("qrc/Main.qml"));
    engine.loadFromModule("App", "Main");
    return app.exec();
}
