//
// Created by loukas on 2026/4/3.
//

#ifndef IQMLDEMO_MYCLASS_H
#define IQMLDEMO_MYCLASS_H
#include <QObject>
#include <QTimer>
#include <QDateTime>
#define MYCLASS (Myclass::getInstance())

class Myclass :public QObject{
    Q_OBJECT
    Q_PROPERTY(int level READ getLevel WRITE setLevel NOTIFY levelChanged);
    Q_PROPERTY(bool status READ getStatus WRITE setStatus NOTIFY statusChanged);
    Q_PROPERTY(QString time READ getTime WRITE setTime NOTIFY updateTime);
    public:
    explicit Myclass(QObject* parent = nullptr);
    ~Myclass();

    static  Myclass* getInstance();

    int level =0;
    QString time = "00:00:00";

    bool status = false;
    QTimer *updateTimer;

    int getLevel()const;

    void setLevel(int level);
    bool getStatus()const;
    void setStatus(bool status);

    QString getTime() const;
    void setTime(QString time);
signals:
    void levelChanged(int level);
    void statusChanged(bool status);
    void updateTime(QString time);

public slots:
    void slotUpdateTimer();

private:

};


#endif //IQMLDEMO_MYCLASS_H