//
// Created by zql on 2026/4/8.
//

#ifndef IQMLDEMO_PAGERESULT_H
#define IQMLDEMO_PAGERESULT_H


#pragma once
#include <QList>

template<typename T>
struct PageResult {
    QList<T> records;
    int total = 0;
};

#endif //IQMLDEMO_PAGERESULT_H