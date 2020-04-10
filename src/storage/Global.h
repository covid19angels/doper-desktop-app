#ifndef GLOBAL_H
#define GLOBAL_H

#include <QString>
#include <QObject>
class GlobalStorage:public  QObject
{
    Q_OBJECT
    Q_PROPERTY(QString accessToken READ accessToken WRITE setAccessToken NOTIFY accessTokenChanged)
    Q_PROPERTY(QString refreshToken READ refreshToken WRITE setRefreshToken NOTIFY refreshTokenChanged)
    Q_PROPERTY(int expiresIn READ expiresIn WRITE setExpiresIn NOTIFY expiresInChanged)
    Q_PROPERTY(bool loginStatus READ loginStatus WRITE setLoginStatus NOTIFY loginStatusChanged)
    Q_PROPERTY(QString loginHintInfo READ loginHintInfo WRITE setLoginHintInfo NOTIFY loginHintInfoChanged)
    Q_PROPERTY(QString loginPlatform READ loginPlatform WRITE setLoginPlatform NOTIFY loginPlatformChanged)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
public:
//    QString accessToken;
//    QString refreshToken;
//    int32_t expiresIn;
//    bool loginStatus;
    GlobalStorage();
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
    QString accessToken() const
    {
        return m_accessToken;
    }

    QString refreshToken() const
    {
        return m_refreshToken;
    }

    int expiresIn() const
    {
        return m_expiresIn;
    }

    bool loginStatus() const
    {
        return m_loginStatus;
    }

    QString loginHintInfo() const
    {
        return m_loginHintInfo;
    }

    QString loginPlatform() const
    {
        return m_loginPlatform;
    }

    QString username() const
    {
        return m_username;
    }

signals:

    void accessTokenChanged(QString accessToken);

    void refreshTokenChanged(QString refreshToken);

    void expiresInChanged(int expiresIn);

    void loginStatusChanged(bool loginStatus);

    void loginHintInfoChanged(QString loginHintInfo);

    void loginPlatformChanged(QString loginPlatform);

    void usernameChanged(QString username);

public slots:


void setAccessToken(QString accessToken)
{
    if (m_accessToken == accessToken)
        return;

    m_accessToken = accessToken;
    emit accessTokenChanged(m_accessToken);
}

void setRefreshToken(QString refreshToken)
{
    if (m_refreshToken == refreshToken)
        return;

    m_refreshToken = refreshToken;
    emit refreshTokenChanged(m_refreshToken);
}

void setExpiresIn(int expiresIn)
{
    if (m_expiresIn == expiresIn)
        return;

    m_expiresIn = expiresIn;
    emit expiresInChanged(m_expiresIn);
}

void setLoginStatus(bool loginStatus)
{
    if (m_loginStatus == loginStatus)
        return;

    m_loginStatus = loginStatus;
    emit loginStatusChanged(m_loginStatus);
}

void setLoginHintInfo(QString loginHintInfo)
{
    if (m_loginHintInfo == loginHintInfo)
        return;

    m_loginHintInfo = loginHintInfo;
    emit loginHintInfoChanged(m_loginHintInfo);
}

void setLoginPlatform(QString loginPlatform)
{
    if (m_loginPlatform == loginPlatform)
        return;

    m_loginPlatform = loginPlatform;
    emit loginPlatformChanged(m_loginPlatform);
}

void setUsername(QString username)
{
    if (m_username == username)
        return;

    m_username = username;
    emit usernameChanged(m_username);
}

private:
static GlobalStorage *instance;
QString m_accessToken;
QString m_refreshToken;
int m_expiresIn;
bool m_loginStatus;
QString m_loginHintInfo;
QString m_loginPlatform;
QString m_username;
};
#endif // GLOBAL_H
