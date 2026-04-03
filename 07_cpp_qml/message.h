//
// Created by loukas on 2026/4/3.
//

#ifndef IQMLDEMO_MESSAGE_H
#define IQMLDEMO_MESSAGE_H
#include <QObject>


class Message :public QObject{
    Q_OBJECT
    Q_PROPERTY(int value READ getValue WRITE setValue NOTIFY valueChanged)

public:
    explicit Message(QObject *parent = nullptr);


    enum class StatusA {
        Ready,
        Loading,
        Finished
    };

    enum class StatusB {
        Ready = 100,
        Loading,
        Finished
    };

    Q_ENUM(StatusA)
    Q_ENUM(StatusB)

    int getValue()const ;
    void setValue(int value);
signals:
    void valueChanged(int value);
private:
    int m_value=0;
};


#endif //IQMLDEMO_MESSAGE_H