//
// Created by loukas on 2026/4/7.
//

#include "UserRepository.h"

QList<User> UserRepository::fetchUsers(const UserPageReq* req) {
    if (!cache.isEmpty()) {
        return cache;
    }

    cache = userService->getUsers(req);
    return cache;
}
