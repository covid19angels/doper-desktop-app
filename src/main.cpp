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

//void logInit(int argc, char *argv[]){
//    el::Configurations conf("./my-conf.conf");
//    // Reconfigure single logger
//    el::Loggers::reconfigureLogger("default", conf);
//    // Actually reconfigure all loggers instead
//    el::Loggers::reconfigureAllLoggers(conf);

//    START_EASYLOGGINGPP(argc, argv);
//}

//void dataBaseInit(){
//    QSqlDatabase db;
//    db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setDatabaseName("F:/doper-app/db/chat.db");
//    db.open();

//    if(!db.open()){
//        LOG(INFO) <<"error in opening DB";
//        LOG(INFO) << db.lastError();
//    }
//    else{
//        LOG(INFO) <<"connected to DB" ;
//    }
//}

//void registerSingletonModel(QQmlApplicationEngine* engine){
//    GraphqlClient* graphqlclient = new GraphqlClient();
//    engine->rootContext()->setContextProperty("graphqlclient",graphqlclient);
//    engine->rootContext()->setContextProperty("pluginsManager",AppPluginManager::getInstance());
//    engine->rootContext()->setContextProperty("globalStorage",GlobalStorage::getInstance());
//}

//void registerTypeModel(){
//    qmlRegisterType<Plugin>("PluginTool",1,0,"Plugin");
//    qmlRegisterType<SqlConversationModel>("MySqlModel", 1, 0, "SqlConversationModel");
//    qmlRegisterType<WebDataComponent>("WebDataComponent", 1, 0, "WebDataComponent");
//}
int main(int argc, char *argv[])
{
    //    logInit(argc,argv);

    el::Configurations conf("./my-conf.conf");
    // Reconfigure single logger
    el::Loggers::reconfigureLogger("default", conf);
    // Actually reconfigure all loggers instead
    el::Loggers::reconfigureAllLoggers(conf);

    START_EASYLOGGINGPP(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //    dataBaseInit();

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


    //    registerSingletonModel(&engine);
    //    registerSingletonModel(&engine);
    GraphqlClient* graphqlclient = new GraphqlClient();
    engine.rootContext()->setContextProperty("graphqlclient",graphqlclient);
    engine.rootContext()->setContextProperty("pluginsManager",AppPluginManager::getInstance());
    engine.rootContext()->setContextProperty("globalStorage",GlobalStorage::getInstance());


    qmlRegisterType<Plugin>("PluginTool",1,0,"Plugin");
    qmlRegisterType<SqlConversationModel>("MySqlModel", 1, 0, "SqlConversationModel");
    qmlRegisterType<WebDataComponent>("WebDataComponent", 1, 0, "WebDataComponent");
//    qDebug() <<"there is run" ;
//    graphqlclient->login("manager","123456");
//    graphqlclient->quit();
//    graphqlclient->login("manager","123456");

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);


    //更新
    //create the updater with the application as parent -> will live long enough start the tool on exit
    //    auto updater = new QtAutoUpdater::Updater::create("qtifw", {
    //                                                                   {"path", "C:/Qt/MaintenanceTool"} //.exe or .app is automatically added on the platform
    //                                                               }, &app);
    //    auto updater = new QtAutoUpdater::Updater::create(nullptr);
    //    QObject::connect(updater, &QtAutoUpdater::Updater::checkUpdatesDone, [updater](QtAutoUpdater::Updater::State state) {
    //        qDebug() << "Update result:" << state;
    //        if (state == QtAutoUpdater::Updater::State::NewUpdates) {
    //            //As soon as the application quits, the maintenancetool will be started in update mode
    //            qDebug() << "Update info:" << updater->updateInfo();
    //            updater->runUpdater();
    //        }
    //        //Quit the application
    //        qApp->quit();
    //    });



    return app.exec();
}



