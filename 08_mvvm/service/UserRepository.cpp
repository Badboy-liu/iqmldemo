//
// Created by loukas on 2026/4/7.
//

#include "UserRepository.h"

PageResult<User> UserRepository::fetchUsers(const std::shared_ptr<UserPageReq> req) {
    return userService->getUsers(req);;
}
