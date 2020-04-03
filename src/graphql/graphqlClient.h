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

    void login(void);

public  slots:
    void loginSucess(QNetworkReply*);
private:
    QNetworkAccessManager* networkManager;
};

#endif // GraphqlClient_H
