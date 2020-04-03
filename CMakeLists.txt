cmake_minimum_required(VERSION 3.1)

set(CMAKE_TOOLCHAIN_FILE D:/vcpkg/scripts/buildsystems/vcpkg.cmake)

project(doper-app LANGUAGES CXX)

MESSAGE("CMAKE_TOOLCHAIN_FILE: " ${CMAKE_TOOLCHAIN_FILE})

#set(CMAKE_BUILD_TYPE debug)
IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Release)
ENDIF()
MESSAGE("Build type: " ${CMAKE_BUILD_TYPE})
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5  COMPONENTS  Sql Core Widgets Quick WebEngine WebChannel AutoUpdaterCore AutoUpdaterWidgets REQUIRED)
find_package(fmt CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)

add_executable(${PROJECT_NAME} "src/main.cpp"

    "src/plugin/Plugin.h"
    "src/plugin/Plugin.cpp"
    "src/plugin/AppPluginManager.h"
    "src/plugin/AppPluginManager.cpp"
    "src/pluginInterface/IAppPluginInterface.h"
    "src/pluginInterface/PluginMetaData.h"
    "src/pluginInterface/PluginMetaData.cpp"
    "src/easylog/easylogging++.h"
    "src/easylog/easylogging++.cc"
    "src/graphql/welcome.hpp"
    "src/model/ChatModel.cpp"
    "src/model/ChatModel.h"
    "src/model/ChatSqlQueryModel.cpp"
    "src/model/ChatSqlQueryModel.h"
    "src/graphql/graphqlClient.h"
    "src/graphql/graphqlClient.cpp"
    "src/storage/global.h"
    "src/storage/global.cpp"
    "src/web/WebDataComponent.h"
    "src/web/WebDataComponent.cpp"
    "qml.qrc")
if(${CMAKE_CXX_COMPILER} MATCHES ".*/(g\\+\\+)(\\..*)")
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE "-mwindows")
elseif(${CMAKE_CXX_COMPILER} MATCHES ".*/(cl)(\\..*)")
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE "/SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup")
endif()

#target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core  Qt5::Sql Qt5::Widgets Qt5::Quick Qt5::WebEngine Qt5::WebChannel  Qt5::AutoUpdaterCore Qt5::AutoUpdaterWidgets )
target_link_libraries(${PROJECT_NAME} PRIVATE nlohmann_json nlohmann_json::nlohmann_json)
