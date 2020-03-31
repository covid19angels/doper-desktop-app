#ifndef APP_PLUGIN_H
#define APP_PLUGIN_H

#include <QDate>
#include <QObject>
#include <QString>

class Plugin : public QObject
{
    Q_OBJECT

    // 插件ID
    Q_PROPERTY(QString _id READ id CONSTANT);

    // 插件名称
    Q_PROPERTY(QString _name READ name CONSTANT);
    // 插件位置
    Q_PROPERTY(QString _path READ path CONSTANT);
    // 插件版本名称
    Q_PROPERTY(QString _version_name READ version_name CONSTANT);
    // 插件版本号
    Q_PROPERTY(int _version_code READ version_code CONSTANT);
    // 插件描述
    Q_PROPERTY(QString _desc READ desc CONSTANT);
    // icon 本地地址
    Q_PROPERTY(QString _icon_local READ icon_local CONSTANT);
    // icon 远程地址
    Q_PROPERTY(QString _icon_remotely READ icon_remotely CONSTANT);
    // 最后更新时间
    Q_PROPERTY(qint64 _date READ date CONSTANT);
    // dev  release test
    Q_PROPERTY(QString _status READ status CONSTANT);
    // 是否强制跟新
    Q_PROPERTY(bool _force_update READ force_update CONSTANT);
    // 是否启用
    Q_PROPERTY(bool _enable READ enable CONSTANT);
    // 作者
    Q_PROPERTY(QString _author READ author CONSTANT);
    // 是否是独立窗口
    Q_PROPERTY(bool _independent_window READ independent_window CONSTANT);
    // main_qml
    Q_PROPERTY(QString _main_qml READ main_qml CONSTANT);

public:
    Plugin();

    ~Plugin();

    // 插件ID
    QString _id;
    // 插件名称
    QString _name;
    // 插件位置
    QString _path;
    // 插件版本名称
    QString _version_name;
    // 插件版本号
    int _version_code;
    // 插件描述
    QString _desc;
    // icon 本地地址
    QString _icon_local;
    // icon 远程地址
    QString _icon_remotely;
    // 最后更新时间
    qint64 _date;
    // dev  release test
    QString _status;
    // 是否强制跟新
    bool _force_update;
    // 是否启用
    bool _enable;
    // 作者
    QString _author;

    // 是否是独立窗口
    bool _independent_window;

    QString _main_qml;

    // 插件ID
    QString id();

    // 插件名称
    QString name();

    // 插件位置
    QString path();

    // 插件版本名称
    QString version_name();

    // 插件版本号
    int version_code();

    // 插件描述
    QString desc();

    // icon 本地地址
    QString icon_local();

    // icon 远程地址
    QString icon_remotely();

    // 最后更新时间
    qint64 date();

    // dev  release test
    QString status();

    // 是否强制跟新
    bool force_update();

    // 是否启用
    bool enable();

    // 作者
    QString author();
    // 是否独立窗口
    bool independent_window();

    QString main_qml();
};

#endif //APP_PLUGIN_H
