//
// Created by loukas on 2026/4/7.
//

#include "UserService.h"

PageResult<User> UserService::getUsers(const std::shared_ptr<UserPageReq> req) {
    return userDao->queryAll(req);
}

void UserService::updateUser(int id, const QString& name, int age)
{
    userDao->updateUser(id,name,age);
}

void UserService::addUser(const QString& name, int age)
{
    userDao->addUser(name,age);
}
