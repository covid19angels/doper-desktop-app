//
// Created by 毛华伟 on 2020/1/3.
//

#include "PluginMetaData.h"

PluginMetaData::PluginMetaData()
{
}

QString *PluginMetaData::getData() const
{
    return data;
}

void PluginMetaData::setData(QString *data)
{
    PluginMetaData::data = data;
}

QObject *PluginMetaData::getObject() const
{
    return object;
}

void PluginMetaData::setObject(QObject *object)
{
    PluginMetaData::object = object;
}
