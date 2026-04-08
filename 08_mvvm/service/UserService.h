//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERSERVICE_H
#define IQMLDEMO_USERSERVICE_H
#include <qcalendar.h>
#include <QList>

#include "../dao/UserDao.h"
#include "../entity/User.h"


class UserService {
    public:
    QList<User> getUsers(const UserPageReq* req);
    UserService() {
        userDao = new UserDao();
    }
private:
    UserDao *userDao;
};


#endif //IQMLDEMO_USERSERVICE_H