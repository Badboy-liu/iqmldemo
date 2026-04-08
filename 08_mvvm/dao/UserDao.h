//
// Created by loukas on 2026/4/7.
//
#include <QList>
#ifndef IQMLDEMO_USERDAO_H
#define IQMLDEMO_USERDAO_H

#include "../db/DatabaseManager.h"
#include "../entity/User.h"
#include "QSqlQuery"
#include "req/UserPageReq.h"

class User;

class UserDao {
public:
    QList<User> queryAll(const UserPageReq* req);
};


#endif //IQMLDEMO_USERDAO_H