﻿import QtQuick 2.12
import QtQuick.Window 2.12
import "./app"
import"./"
Window {
    id:root
    visible: true

    height: 0
    width: 0
    minimumHeight: 0
    maximumHeight: 0
    opacity: 0
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log("aaa")
        }
    }

    MainItem {
        id:mainWindow
        visible: globalStorage.loginStatus
    }

    MiniorItem{
        id:miniorWindow
        visible: globalStorage.loginStatus
    }

    LoginItem{
        visible: !globalStorage.loginStatus
    }

    TestItem{
        visible: false
    }

    SystemTrayManager{

    }

}
