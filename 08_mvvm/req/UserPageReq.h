//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USERPAGEREQ_H
#define IQMLDEMO_USERPAGEREQ_H
#include <QObject>
#include <QString>

#include "PageReq.h"


class UserPageReq : public QObject {
    Q_OBJECT

    Q_PROPERTY(int pageNo MEMBER pageNo NOTIFY pageNoChanged)
    Q_PROPERTY(int pageSize MEMBER pageSize)
    Q_PROPERTY(QString keyword MEMBER keyword)
public:
    int pageNo = 1;
    int pageSize = 10;
    QString keyword;

    signals:
        void pageNoChanged();
};


#endif //IQMLDEMO_USERPAGEREQ_H