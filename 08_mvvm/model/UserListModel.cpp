//
// Created by loukas on 2026/4/7.
//

#include "UserListModel.h"
UserListModel::UserListModel(QObject *parent):QAbstractListModel(parent) {

}

int UserListModel::rowCount(const QModelIndex &) const {
    return m_users.size();
}
QVariant UserListModel::data(const QModelIndex &index,int role) const {
    const auto &u = m_users[index.row()];
    switch (role) {
        case IdRole:return u.getId();
        case NameRole:return u.getName();
        case AgeRole:return u.getAge();
    }
    return {};
}
QHash<int, QByteArray> UserListModel::roleNames() const {
    return {
        {IdRole,"id"},
        {NameRole,"name"},
        {AgeRole,"age"},
    };
}

void UserListModel::setUsers(const QList<User> &users) {
    beginResetModel();
    m_users = users;
    endResetModel();
}
