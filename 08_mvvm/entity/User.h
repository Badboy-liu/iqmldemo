//
// Created by loukas on 2026/4/7.
//

#ifndef IQMLDEMO_USER_H
#define IQMLDEMO_USER_H
#pragma once
#include <QString>

class User {
    int id;
    QString name;
    int age;
public:
    User(int id, QString name, int age):id(id),name(name),age(age) {

    }
    int getId() const {
        return id;
    }
    QString getName() const {
        return name;
    }
    int getAge() const {
        return age;
    }
};


#endif //IQMLDEMO_USER_H