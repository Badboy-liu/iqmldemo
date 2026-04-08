//
// Created by loukas on 2026/4/7.
//

#include "UserRepository.h"

PageResult<User> UserRepository::fetchUsers(const std::shared_ptr<UserPageReq> req) {
    return userService->getUsers(req);;
}

void UserRepository::updateUser(int id, const QString& name, int age)
{
    userService->updateUser(id,name,age);
    return;
}

void UserRepository::addUser(const QString& name, int age)
{
    userService->addUser(name,age);
}
