#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSystemTrayIcon>
#include <QAction>
#include <QMenu>
#include <QSqlQuery>
#include <QDebug>
#include <QObject>
#include <QSqlError>
#include <QtWebEngine/QtWebEngine>
//#include <QtAutoUpdaterCore/Updater>

#include <string>
#include <exception>

#include "src/plugin/AppPluginManager.h"
#include "src/easylog/easylogging++.h"
#include "src/graphql/welcome.hpp"
#include "src/model/ChatSqlQueryModel.h"
#include "src/graphql/graphqlClient.h"
#include "src/web/WebDataComponent.h"
#include "src/storage/Global.h"
//easylog++

INITIALIZE_EASYLOGGINGPP


int main(int argc, char *argv[])
{
    el::Configurations conf("./my-conf.conf");
    // Reconfigure single logger
    el::Loggers::reconfigureLogger("default", conf);
    // Actually reconfigure all loggers instead
    el::Loggers::reconfigureAllLoggers(conf);

    START_EASYLOGGINGPP(argc, argv);

    QString logStr = "碧玉妆成一树高，万条垂下绿丝绦，不知细叶谁裁出，二月春风似剪刀";
    LOG(INFO) <<  logStr;
    QString helloStr = "欢迎你的到来";

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);




    QSqlDatabase db;
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("F:/doper-app/db/chat.db");
    db.open();

    if(!db.open()){
        qDebug() <<"error in opening DB";
        qDebug() << db.lastError();
    }
    else{
        qDebug() <<"connected to DB" ;
    }

    QQmlApplicationEngine engine;
    QtWebEngine::initialize();
    engine.rootContext()->setContextProperty("pluginsManager",AppPluginManager::getInstance());
    engine.rootContext()->setContextProperty("globalStorage",GlobalStorage::getInstance());
    qmlRegisterType<Plugin>("PluginTool",1,0,"Plugin");
    qmlRegisterType<SqlConversationModel>("MySqlModel", 1, 0, "SqlConversationModel");
    qmlRegisterType<WebDataComponent>("WebDataComponent", 1, 0, "WebDataComponent");
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
    GraphqlClient* graphqlclient = new GraphqlClient();
    graphqlclient->login();
    return app.exec();
}
