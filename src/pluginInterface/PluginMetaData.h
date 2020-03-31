#ifndef IAPPPLUGININTERFACE_PLUGINMETADATA_H
#define IAPPPLUGININTERFACE_PLUGINMETADATA_H

#include <QObject>

class PluginMetaData : public QObject
{
private:
    QString *data;
    QObject *object;

public:
    PluginMetaData();

    QString *getData() const;

    void setData(QString *data);

    QObject *getObject() const;

    void setObject(QObject *object);
};


#endif //IAPPPLUGININTERFACE_PLUGINMETADATA_H
