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

void GraphqlClient::login(void)
{
    QNetworkRequest request;
    request.setUrl(QUrl("http://47.93.9.213/gwauthcow"));
    request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
    nlohmann::json query;
    query["query"] = R"(
                    mutation{
                    login(loginInput:{
                    grantType:"password"
                    username: "manager"
                    password:"123456"
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

                    )";

    QString queryStr = QString::fromStdString(query.dump());
    QByteArray queryByte = queryStr.toUtf8();
    networkManager->post(request, queryByte);

    QObject::connect(networkManager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(loginSucess(QNetworkReply*)));
}

void GraphqlClient::loginSucess(QNetworkReply* reply)
{
    nlohmann::json result;
    if (reply->error()) {
        qDebug() << reply->errorString();
        return;
    }
    std::string answer = reply->readAll().toStdString();
    //LOG(INFO) << answer;
    result =  nlohmann::json::parse(answer);
    LOG(INFO) << result["data"]["login"]["tokenInfo"].is_null();
    if(result["data"]["login"]["tokenInfo"].is_null()){
        LOG(INFO) << "login fail";
        LOG(INFO) << "login fail" << result["data"]["login"]["userErrors"][0]["message"].get<std::string>();
    }else{
        LOG(INFO) << "login sucess";
        auto tokenInfo =  result["data"]["login"]["tokenInfo"];
        GlobalStorage::getInstance()->accessToken = QString::fromStdString(tokenInfo["accessToken"].get<std::string>());
        GlobalStorage::getInstance()->refreshToken = QString::fromStdString(tokenInfo["refreshToken"].get<std::string>());
        GlobalStorage::getInstance()->expiresIn = tokenInfo["expiresIn"].get<int>();
        LOG(INFO) << GlobalStorage::getInstance()->accessToken;
        LOG(INFO) << GlobalStorage::getInstance()->refreshToken;
        LOG(INFO) << GlobalStorage::getInstance()->expiresIn;
    }
    LOG(INFO) << "answer";
}



