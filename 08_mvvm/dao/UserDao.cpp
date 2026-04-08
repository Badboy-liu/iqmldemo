//
// Created by loukas on 2026/4/7.
//

#include "UserDao.h"




QList<User> UserDao::queryAll(const UserPageReq* req) {
    QList<User> list;
    auto db = DatabaseManager::getConnection();
    QSqlQuery query(db);

    int offset = (req->pageNo - 1) * req->pageSize;
    QString sql = R"("SELECT * FROM user where name like concat("%",?,"%") limit ? offset ?)";
    query.prepare(sql);
    query.addBindValue(req->keyword);
    query.addBindValue(req->pageSize);
    query.addBindValue(offset);
    query.exec();

    while (query.next()) {
        list.append(
            User{
                query.value("id").toInt(),
                query.value("name").toString(),
                query.value("age").toInt(),
            });
    }

    return list;

}
