//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERLISTMODEL_H
#define IQMLDEMO_USERLISTMODEL_H
#include <QAbstractListModel>

#include "../entity/User.h"

class UserListModel :public QAbstractListModel{
    Q_OBJECT
    public:
    explicit UserListModel(QObject *parent = nullptr);
    enum Roles {
        IdRole = Qt::UserRole+1,
        NameRole,
        AgeRole,
    };

    int rowCount(const QModelIndex &parent) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;
    void setUsers(const QList<User>& users);
    private:
    QList<User> m_users;
};



#endif //IQMLDEMO_USERLISTMODEL_H
