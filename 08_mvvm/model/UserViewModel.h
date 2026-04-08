//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERVIEWMODEL_H
#define IQMLDEMO_USERVIEWMODEL_H
#include <QObject>
#include <QtConcurrent>

#include "UserListModel.h"
#include "../service/UserRepository.h"


class UserViewModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* model READ model NOTIFY modelChanged)
    Q_PROPERTY(int total READ total NOTIFY totalChanged)
    Q_PROPERTY(bool loading READ loading NOTIFY loadingChanged)

public:
    explicit UserViewModel(QObject* parent = nullptr);
    UserListModel* model() const;
    Q_INVOKABLE void load(UserPageReq* req);
    Q_INVOKABLE void update(int id, const QString& name, int age);
    Q_INVOKABLE void add(const QString& name, int age);
    int total() const { return m_total; }
    bool loading() const { return m_loading; }
    QAbstractListModel* model() { return m_model; }
signals:
    void modelChanged();
    void totalChanged();
    void loadingChanged();
private:
    UserListModel* m_model;
    UserRepository* repo;
    int m_total = 0;
    bool m_loading = false;
};


#endif //IQMLDEMO_USERVIEWMODEL_H
