//
// Created by 毛华伟 on 2020/3/17.
//

#include "WebDataComponent.h"
#include "src/storage/Global.h"


WebDataComponent::WebDataComponent() {}

WebDataComponent::~WebDataComponent() {}

QString WebDataComponent::get_app_access_token()
{
    qDebug() << "bdlbsc::WebDataComponent::get_app_access_token";
    return GlobalStorage::getInstance()->accessToken() ;
    //return _app_access_token;
}

QString WebDataComponent::get_user_access_token()
{
    return "test:: user_access_token";
    //return _user_access_token;
}

QString WebDataComponent::get_data()
{
    return "test:: data";
}

QString WebDataComponent::get_access_token()
{
    return GlobalStorage::getInstance()->accessToken() ;
}

QString WebDataComponent::get_refresh_token()
{
    return GlobalStorage::getInstance()->refreshToken() ;
}

int WebDataComponent::get_expiresIn()
{
    return GlobalStorage::getInstance()->expiresIn() ;
}

QString WebDataComponent::get_user_id()
{

    return "test:: user_id";
    //  return _user_id;
}

void WebDataComponent::send_app_access_token(QString values)
{

    emit app_access_token_change(values);
}

void WebDataComponent::send_user_access_token(QString values)
{

    emit user_access_token_change(values);
}

void WebDataComponent::send_user_id(QString values)
{

    emit user_id_change(values);
}

void WebDataComponent::send_data(QString data)
{
    _data = data;
    emit data_change(data);
}


void WebDataComponent::on_send_data(QString data) {


    qDebug()<<"on_send_data : "<<data;

}
