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
    Q_INVOKABLE void quit();
    Q_INVOKABLE void getPluginJson();
public  slots:
    void loginResponse();
    void getPluginJsonResponse();
    void error(QNetworkReply::NetworkError code);
private:
    QNetworkAccessManager* networkManager;
    QNetworkReply* reply;
};

#endif // GraphqlClient_H
