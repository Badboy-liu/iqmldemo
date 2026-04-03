//
// Created by loukas on 2026/4/3.
//

#include "Myclass.h"

Q_GLOBAL_STATIC(Myclass,m_Myclass)

Myclass::Myclass(QObject *parent):QObject(parent){
    updateTimer = new QTimer(this);
    updateTimer->start(1000);
    connect(updateTimer,SIGNAL(timeout()),this,SLOT(slotUpdateTimer()));
    time = QTime::currentTime().toString();
}

Myclass::~Myclass() {
    if (updateTimer) {
        delete updateTimer;
    }

}
void Myclass::slotUpdateTimer() {
    setStatus(!status);

    QDateTime currentTime = QDateTime::currentDateTime();
    QTime time = QTime::currentTime();
    QString timeString = time.toString();
    if (this->time != timeString) {
        this->time = timeString;   // ⭐ 更新数据
        emit updateTime(this->time); // ⭐ 通知QML
    }
}

Myclass *Myclass::getInstance() {
    return ::m_Myclass;
}

bool Myclass::getStatus() const{
    return status;
}
void Myclass::setStatus(bool status) {
    this->status = status;
    emit statusChanged(status);
}

QString Myclass::getTime() const {
    return this->time;
}

void Myclass::setTime(QString time) {
    this->time = time;
}

int Myclass::getLevel() const {
    return level;
}

void Myclass::setLevel(int level) {
    this->level = level;
    emit levelChanged(level);
}


