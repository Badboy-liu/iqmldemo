//
// Created by loukas on 2026/4/7.
//

#include "DatabaseManager.h"
#include "DatabaseManager.h"

QSqlDatabase DatabaseManager::getConnection() {
    QString connName = QString("conn_%1").arg((quintptr)QThread::currentThreadId());

    if (QSqlDatabase::contains(connName)) {
        return QSqlDatabase::database(connName);
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL",connName);

    db.setHostName("127.0.0.1");
    db.setDatabaseName("test_db");
    db.setUserName("root");
    db.setPassword("123456");
    db.open();
    return db;
}
