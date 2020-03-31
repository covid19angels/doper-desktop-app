#include "ChatModel.h"

sqliteModel::sqliteModel(QObject *parent):QAbstractListModel(parent)
{

}

sqliteModel::~sqliteModel()
{

}

int sqliteModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    qDebug()<< m_msgList.count();
    return m_msgList.count();
}

QHash<int, QByteArray> sqliteModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames.insert(idRole, "id");
    roleNames.insert(nameRole, "userName");
    roleNames.insert(msgRole, "eventMessage");
    roleNames.insert(dateRole, "dateTime");
    qDebug()<< roleNames;
    return roleNames;
}

QVariant sqliteModel::data(const QModelIndex &index, int role) const
{
    //索引超过索引范围
    if (index.row() < 0 || index.row() >= m_msgList.count())
    {
        return QVariant();
    }

    QVariant text;

    if(role == idRole)
    {
        userEventLogMsg msg = m_msgList[index.row()];
        text = msg.id;
        qDebug() << text;
    }
    else if(role == nameRole)
    {
        userEventLogMsg msg = m_msgList[index.row()];
        text = msg.username;
        qDebug() << text;
    }
    else if(role == msgRole)
    {
        userEventLogMsg msg = m_msgList[index.row()];
        text = msg.eventmessage;
        qDebug() << text;
    }
    if(role == dateRole)
    {
        userEventLogMsg msg = m_msgList[index.row()];
        text = msg.datetime;
        qDebug() << text;
    }
    return text;
}

void sqliteModel::addEvent(const userEventLogMsg &msg)
{
    beginInsertRows(QModelIndex(), 0, 0);
    m_msgList.insert(0, msg);
    endInsertRows();

    //QListIterator<userEventLogMsg> iter(m_msgList);
    //while(iter.hasNext())
    //{
    // The next() function returns the next item in the list and advances the iterator.
    //qDebug() << iter.next();
    //}
}
