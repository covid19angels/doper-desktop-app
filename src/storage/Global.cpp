#include "Global.h"


GlobalStorage *GlobalStorage::instance = nullptr;
GlobalStorage::GlobalStorage()
{
    m_loginStatus = false;

}
