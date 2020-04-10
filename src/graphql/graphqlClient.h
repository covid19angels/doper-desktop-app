#ifndef GraphqlClient_H
#define GraphqlClient_H

#include <QJsonObject>
#include <QString>
#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
class GraphqlClient :public QObject
{
    Q_OBJECT
public:
    GraphqlClient();

    Q_INVOKABLE void login(QString,QString);


public  slots:
    void loginResponse(QNetworkReply*);
private:
    QNetworkAccessManager* networkManager;
};

#endif // GraphqlClient_H
