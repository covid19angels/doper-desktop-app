#include "Global.h"


GlobalStorage *GlobalStorage::instance = nullptr;
GlobalStorage::GlobalStorage()
{
    loginStatus = false;

}
