#ifndef GLOBAL_H
#define GLOBAL_H

#include <QString>
#include <QObject>
class GlobalStorage:public  QObject
{
    Q_OBJECT

public:
    QString accessToken;
    QString refreshToken;
    int32_t expiresIn;
    bool loginStatus;
    GlobalStorage()  ;
    ~GlobalStorage() { };
    GlobalStorage(const GlobalStorage&);
    GlobalStorage& operator=(const GlobalStorage&);
    static GlobalStorage* getInstance()
     {
         if (instance == nullptr) {
             instance = new GlobalStorage();
         }
         return instance;
    }

public:
    static GlobalStorage *instance;
};
#endif // GLOBAL_H
