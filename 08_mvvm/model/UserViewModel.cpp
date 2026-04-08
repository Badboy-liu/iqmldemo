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

    m_loading = true;
    emit loadingChanged();

    // ✅ 拷贝参数（防止悬空）
    auto copy = std::make_shared<UserPageReq>();
    copy->keyword = req->keyword;
    copy->pageNo = req->pageNo;
    copy->pageSize = req->pageSize;

    QtConcurrent::run([this, copy]() {

        // 👉 后台线程
        auto page = repo->fetchUsers(copy);

        // 👉 回到主线程
        QMetaObject::invokeMethod(this, [this, page]() {

            // ✅ 更新数据
            m_model->setUsers(page.records);
            m_total = page.total;

            emit modelChanged();
            emit totalChanged();

            // ✅ loading 在这里结束（关键！）
            m_loading = false;
            emit loadingChanged();

        }, Qt::QueuedConnection);   // ✅ 强制主线程
    });
}
