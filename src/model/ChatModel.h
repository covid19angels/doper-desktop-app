#pragma once

#include <assert.h>
#include <list>
#include <QList>
#include <QColor>
#include <QObject>
#include <QDebug>
#include <QString>
#include <QFileInfo>
#include <QDateTime>
#include <QQmlError>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtSql/QSqlRecord>
#include <QModelIndex>
#include <QAbstractListModel>
#include <QListIterator>


/*
QSqlQuery myQuery("SELECT id, userName, eventMessage, dateTime FROM chat_history");

if(myQuery.exec("SELECT id, userName, eventMessage, dateTime FROM chat_history")){
    qDebug()<<"sql statement exicuted fine";
}
else{
    qDebug() <<"Errors accured with sql statement";
    qDebug() <<myQuery.lastError();
}

while (myQuery.next()){
    userEventLogMsg msg;

    QString idString = myQuery.value(0).toString();
    msg.id.insert(0, idString);

    QString userString = myQuery.value(1).toString();
    msg.username.insert(1, userString);

    QString eventString = myQuery.value(2).toString();
    msg.eventmessage.insert(2, eventString);

    QString dateString = myQuery.value(3).toString();
    msg.datetime.insert(3, dateString);

    model->addEvent(msg);
}
 */
struct userEventLogMsg{
    //hold all values for a single list entry,
    QString id;
    QString username;
    QString eventmessage;
    QString datetime;
};

class sqliteModel:public QAbstractListModel
{
    Q_OBJECT

public:
    explicit sqliteModel(QObject *parent = nullptr);

    ~sqliteModel();

    enum userEventRoles {idRole= Qt::UserRole + 220, nameRole, msgRole, dateRole};

    int rowCount(const QModelIndex & parent) const;

    QHash<int, QByteArray> roleNames() const;

    QVariant data(const QModelIndex &index, int role=Qt::DisplayRole) const;

    void addEvent(const userEventLogMsg &msg);

private:
    QList<userEventLogMsg> m_msgList;
};


