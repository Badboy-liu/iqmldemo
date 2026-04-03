//
// Created by loukas on 2026/4/3.
//

#include "Message.h"

Message::Message(QObject *parent):QObject(parent) {

}

int Message::getValue() const {
    return m_value;
}

void Message::setValue(int v) {

    if (this->m_value == v)
        return;
    this->m_value = v;
    emit valueChanged(this->m_value);
}
