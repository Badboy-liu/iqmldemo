//
// Created by loukas on 2026/4/7.
//

#include "UserViewModel.h"

#include "UserListModel.h"

UserViewModel::UserViewModel(QObject *parent) :QObject(parent){
    m_model = new UserListModel(this);
    repo = new UserRepository();
}

UserListModel* UserViewModel::model() const {
    return m_model;
}

void UserViewModel::load(UserPageReq* req) {

    QtConcurrent::run([=]() {
        UserPageReq copy;
   copy.pageNo = req->pageNo;
   copy.pageSize = req->pageSize;
   copy.keyword = req->keyword;
        auto users = repo->fetchUsers(&copy);
        QMetaObject::invokeMethod(this,[=]() {
           m_model->setUsers(users);
        });
    });
}
