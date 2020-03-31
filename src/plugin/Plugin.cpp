#include "Plugin.h"

Plugin::Plugin() {}

Plugin::~Plugin() {}

QString Plugin::id()
{
    return _id;
}

// 插件名称
QString Plugin::name()
{
    return _name;
}

// 插件位置
QString Plugin::path()
{
    return _path;
}

// 插件版本名称
QString Plugin::version_name()
{
    return _version_name;
}

// 插件版本号
int Plugin::version_code()
{
    return _version_code;
}

// 插件描述
QString Plugin::desc()
{
    return _desc;
}

// icon 本地地址
QString Plugin::icon_local()
{
    return _icon_local;
}

// icon 远程地址
QString Plugin::icon_remotely()
{
    return _icon_remotely;
}

// 最后更新时间
qint64 Plugin::date()
{
    return _date;
}

// dev  release test
QString Plugin::status()
{
    return _status;
}

// 是否强制跟新
bool Plugin::force_update()
{
    return _force_update;
}

// 是否启用
bool Plugin::enable()
{
    return _enable;
}

// 作者
QString Plugin::author()
{
    return _author;
}

bool Plugin::independent_window()
{
    return _independent_window;
}

QString Plugin::main_qml()
{
    return _main_qml;
}
