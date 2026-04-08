//
// Created by loukas on 2026/4/7.
//

#include "UserService.h"

QList<User> UserService::getUsers(const UserPageReq* req) {
    return userDao->queryAll(req);
}
