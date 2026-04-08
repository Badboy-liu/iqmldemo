//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERREPOSITORY_H
#define IQMLDEMO_USERREPOSITORY_H
#include <QList>

#include "UserService.h"


class UserRepository {
public:
    QList<User> fetchUsers(const UserPageReq* req);
    UserRepository() {
        userService = new UserService();
    }
private:
    QList<User> cache;
    UserService *userService;
};


#endif //IQMLDEMO_USERREPOSITORY_H
