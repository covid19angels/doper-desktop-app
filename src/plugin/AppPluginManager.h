#pragma execution_character_set("UTF-8")
#ifndef APP_APPPLUGINMANAGER_H
#define APP_APPPLUGINMANAGER_H

#include "src/pluginInterface/IAppPluginInterface.h"
#include "src/pluginInterface/PluginMetaData.h"
#include "src/plugin/Plugin.h"
#include <QCoreApplication>
#include <QDebug>
#include <QDir>
#include <QObject>
#include <QPluginLoader>
#include <QVariant>

class AppPluginManager : public QObject
{
    Q_OBJECT
public:
    // 获取实例
    static AppPluginManager *getInstance();

     QQmlListProperty<Plugin> plugins();
    // 加载插件
    void loader(Plugin *plugin);
    const QList<Plugin *> getPlugins() const;
    Q_PROPERTY(QQmlListProperty<Plugin> plugins READ plugins NOTIFY pluginsChanged);
private:
    // 私有构造函数
    AppPluginManager();
    // 单实例
    static AppPluginManager *instance;
    // 插件目录
    QDir *pluginsDir;
    // 插件目录字符串
    QString pluginsPath;
    // 所有的插件集合
    QList<Plugin *> qListPlugins;
    // 扫描本地已有插件
    void scanLocalPlugin();
    // 检查是否为插件
    bool checkQLibrary(QString path);
    // 检查是否为自己的插件，防止外部注入
    bool isMePlugin();

    static void appendPlugin(QQmlListProperty<Plugin>*, Plugin*);
    static int pluginsCount(QQmlListProperty<Plugin>*);
    static Plugin* pluginsWithIndex(QQmlListProperty<Plugin>*, int);
    static void clearPlugins(QQmlListProperty<Plugin>*);
    QList<Plugin *> m_plugins;
    QHash<QString, IAppPluginInterface *> pluginsCache;

signals:
    void sendMessage(PluginMetaData *data);
    void pluginsChanged();
public slots:
    void receiveMessage(PluginMetaData *data);


};

#endif //APP_APPPLUGINMANAGER_H
