//
// Created by loukas on 2026/4/7.
//

#include "UserService.h"

PageResult<User> UserService::getUsers(const std::shared_ptr<UserPageReq> req) {
    return userDao->queryAll(req);
}
