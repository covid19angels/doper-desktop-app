#include "GraphqlClient.h"
#include <QNetworkAccessManager>
#include <nlohmann/json.hpp>
#include "src/easylog/easylogging++.h"
#include <iostream>
#include <string>
#include "src/storage/Global.h"
GraphqlClient::GraphqlClient()
{
    networkManager  = new QNetworkAccessManager();

}


void GraphqlClient::login(QString account, QString password)
{
    QNetworkRequest request;
    request.setUrl(QUrl("http://47.93.9.213/gwauthcow"));
    request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
    nlohmann::json query;
    query["query"] = QString(R"(
                    mutation{
                      login(loginInput:{
                        grantType:"password"
                        username: "%1"
                        password:"%2"
                        client:"client"
                        secret:"secret"
                      }){
                        platform
                        tokenInfo{
                          accessToken
                           refreshToken
                          expiresIn
                        }
                        userErrors{
                          message
                        }
                      }
                    }
                    )").arg(account).arg(password).toStdString() ;

    QString queryStr = QString::fromStdString(query.dump());
    QByteArray queryByte = queryStr.toUtf8();
    networkManager->post(request, queryByte);

    QObject::connect(networkManager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(loginResponse(QNetworkReply*)));
}

void GraphqlClient::loginResponse(QNetworkReply* reply)
{
    nlohmann::json result;
    if (reply->error()) {
        LOG(INFO) << reply->errorString();
        return;
    }
    std::string answer = reply->readAll().toStdString();
    result =  nlohmann::json::parse(answer);
    LOG(INFO) << result["data"]["login"]["tokenInfo"].is_null();
    if(result["data"]["login"]["tokenInfo"].is_null()){
        LOG(INFO) << "login fail";
        auto errInfo =  result["data"]["login"]["userErrors"][0]["message"].get<std::string>();
        LOG(INFO) << errInfo;
        GlobalStorage::getInstance()->setLoginHintInfo(QStringLiteral("账号和密码不正确"));
    }else{
        LOG(INFO) << "login sucess";
        auto tokenInfo =  result["data"]["login"]["tokenInfo"];
        GlobalStorage::getInstance()->setAccessToken( QString::fromStdString(tokenInfo["accessToken"].get<std::string>())) ;
        GlobalStorage::getInstance()->setRefreshToken(  QString::fromStdString(tokenInfo["refreshToken"].get<std::string>()));
        GlobalStorage::getInstance()->setExpiresIn( tokenInfo["expiresIn"].get<int>());
        GlobalStorage::getInstance()->setLoginStatus(true);
        GlobalStorage::getInstance()->setLoginPlatform(QString::fromStdString(result["data"]["login"]["platform"].get<std::string>()));
        GlobalStorage::getInstance()->setUsername("manager");
        LOG(INFO) << GlobalStorage::getInstance()->accessToken();
        LOG(INFO) << GlobalStorage::getInstance()->refreshToken();
        LOG(INFO) << GlobalStorage::getInstance()->expiresIn();

    }
}



