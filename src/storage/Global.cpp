#include "Global.h"


GlobalStorage *GlobalStorage::instance = nullptr;
void GlobalStorage::clear()
{
    setAccessToken("");
    setRefreshToken("");
    setExpiresIn(0);
    setLoginStatus(false);
    setLoginHintInfo("");
    setLoginPlatform("");
    setUsername("");
}

GlobalStorage::GlobalStorage()
{
    m_loginStatus = false;

}
