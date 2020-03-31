#pragma once

#ifndef IAPPPLUGININTERFACE_H
#define IAPPPLUGININTERFACE_H

#include<QString>
#include<QDate>
#include <QtPlugin>
#include <QObject>
#include "PluginMetaData.h"
#include <QQmlEngine>
#include <QQmlComponent>
// 插件接口
class IAppPluginInterface : public QObject
{
public :

    virtual ~IAppPluginInterface()
    {}

    // 接收消息
    virtual void receiveMessage(PluginMetaData *) = 0;

    // 发送消息
    virtual void sendMessage(PluginMetaData *) = 0;
    // 获取item
    virtual QQmlComponent* getViewComponent(QQmlEngine *) = 0;
    // 加载插件
    virtual void loader() = 0;
};

#endif // IAPPPLUGININTERFACE_H

#define IAppPluginInterface_iid "App.Plugin.Interface"

Q_DECLARE_INTERFACE(IAppPluginInterface, IAppPluginInterface_iid)



