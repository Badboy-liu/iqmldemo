#include <iostream>
#include <QString>
#include <QStringList>
#include <QImage>
#include <QJsonObject>
#include <QJsonDocument>
#include <QBuffer>
#include <QDebug>
#include <qguiapplication.h>
#include <ZXing/MultiFormatWriter.h>
#include <ZXing/BitMatrix.h>
#include <QImage>
#include <qqmlapplicationengine.h>
#include <QQuickWindow>
#include <QQmlContext>
#include "constant.h"
#include "myclass.h"
#include <QQmlApplicationEngine>
#include <QGuiApplication>

#include "message.h"


// ===== main =====
int main(int argc,char* arg[])
{
    // 1. 获取 vcpkg 根目录
    QString vcpkgRoot = getVcpkgPath();

    if (vcpkgRoot.isEmpty())
    {
        qCritical() << "无法定位 vcpkg 根目录，程序退出。请确保 'vcpkg' 已添加到系统 PATH 环境变量中。";
        return -1;
    }
    // 2. 动态构建子路径 (使用 QDir 确保跨平台分隔符正确)
    // 假设结构: <root>/installed/x64-windows/debug/...
    // 注意：如果你的 vcpkg 是 release 版本或者混合安装，可能需要去掉 "/debug"
    // 这里严格按照你之前的需求构造 debug 路径
    QString baseInstalled = QDir(vcpkgRoot).filePath("installed/x64-windows");

    // 构造具体目录
    QString binPath = QDir(baseInstalled).filePath("debug/bin"); // DLLs
    QString pluginPath = QDir(baseInstalled).filePath("debug/Qt6/plugins"); // Qt Plugins
    QString qmlPath = QDir(baseInstalled).filePath("debug/Qt6/qml"); // QML Modules
    qDebug() << "Using Vcpkg Root:" << vcpkgRoot;
    qDebug() << "Bin Path:" << binPath;
    qDebug() << "Plugin Path:" << pluginPath;
    qDebug() << "QML Path:" << qmlPath;
    // ❗ 关键：DLL 依赖路径
    // qputenv("QT_VIRTUALKEYBOARD_STYLE", "basic");
    qputenv("PATH", QByteArray(binPath.toLocal8Bit() + ";") + qgetenv("PATH"));
    qputenv("QT_IM_MODULE", "qtvirtualkeyboard");
    qputenv("QT_VIRTUALKEYBOARD_DESKTOP_DISABLE", "0");
    qputenv("QT_QUICK_CONTROLS_STYLE", "Basic");
    qDebug() << "IM module:" << qgetenv("QT_IM_MODULE");
    QCoreApplication::addLibraryPath(pluginPath);
    QString imPath = pluginPath + "/platforminputcontexts";
    QCoreApplication::addLibraryPath(imPath);
    QGuiApplication app(argc, arg);
    QQuickWindow::setGraphicsApi(QSGRendererInterface::OpenGL); // ⭐⭐⭐ 必加
    // QQuickWindow::setGraphicsApi(QSGRendererInterface::Software);
    // qmlRegisterType<VideoItem>("VideoItem",1,0,"VideoItem");
    qInstallMessageHandler([](QtMsgType, const QMessageLogContext&, const QString& msg)
    {
        std::cout << msg.toStdString() << std::endl;
    });



    // qputenv("QT_DEBUG_PLUGINS", "1");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ui",MYCLASS);
    // qmlRegisterType<myclass>("App",1,0,"myclass");
    qmlRegisterType<Message>("MyMessage",1,0,"Message");
    engine.addImportPath(qmlPath);
    engine.load(QUrl("qrc:/main.qml"));
    // engine.addPluginPath(pluginPath);
    qputenv("QML_IMPORT_TRACE", "1");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        [](QObject* obj, const QUrl& objUrl)
        {
            if (!obj)
            {
                qDebug() << "QML load failed:" << objUrl;
            }
        });
    return app.exec();
}