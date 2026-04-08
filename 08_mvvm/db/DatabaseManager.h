//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_DATABASEMANAGER_H
#define IQMLDEMO_DATABASEMANAGER_H
#include <QSqlDatabase>
#include <QThread>

class DatabaseManager {
    public:
    static  QSqlDatabase getConnection();
};


#endif //IQMLDEMO_DATABASEMANAGER_H