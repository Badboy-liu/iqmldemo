//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERVIEWMODEL_H
#define IQMLDEMO_USERVIEWMODEL_H
#include <QObject>
#include <QtConcurrent>

#include "UserListModel.h"
#include "../service/UserRepository.h"


class UserViewModel:public QObject{
    Q_OBJECT
    Q_PROPERTY(UserListModel *model READ model CONSTANT)
public:
    explicit UserViewModel(QObject *parent = nullptr);
    UserListModel *model() const;
    Q_INVOKABLE void load(UserPageReq* req);

private:
    UserListModel *m_model;
    UserRepository *repo;
};


#endif //IQMLDEMO_USERVIEWMODEL_H