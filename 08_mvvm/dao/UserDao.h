//
// Created by loukas on 2026/4/7.
//
#include <QList>
#ifndef IQMLDEMO_USERDAO_H
#define IQMLDEMO_USERDAO_H

#include "../db/DatabaseManager.h"
#include "../entity/User.h"
#include "QSqlQuery"
#include "qDebug"
#include "QSqlError"
#include "req/PageResult.h"
#include "req/UserPageReq.h"

class User;

class UserDao {
public:
    PageResult<User> queryAll(const std::shared_ptr<UserPageReq> req);
    int count(const std::shared_ptr<UserPageReq> req);
    void updateUser(int id, const QString& name, int age);
    void addUser(const QString& name, int age);
};


#endif //IQMLDEMO_USERDAO_H