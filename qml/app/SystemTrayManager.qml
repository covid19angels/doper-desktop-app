import QtQuick 2.12
import Qt.labs.platform 1.1
import Qt3D.Input 2.13
import QtQuick.Window 2.12

Rectangle {
    id:systemTrayItem
    width: 0
    height: 0
    visible: false
    Component.onCompleted: {
        startGlitter()
    }
    function startGlitter(){
        showTimer.start()
    }
    function stopGlitter() {
        showTimer.stop()
        systemTrayIcon.showReal()
    }

    Rectangle{
        id:mouseReat
        width: parent.width
        height: parent.height
    }

    SystemTrayIcon {
        id:systemTrayIcon
        tooltip: "doper-app"
        icon.source: "qrc:/images/logo1.png"
        property bool showMode : true
        onGeometryChanged: {
            systemTrayItem.x=systemTrayIcon.geometry.x
            systemTrayItem.y=systemTrayIcon.geometry.y
            systemTrayItem.height=systemTrayIcon.geometry.height
            systemTrayItem.width=systemTrayIcon.geometry.width
        }

        onTooltipChanged: {
            console.log("你好啊，我是真的出现了哦")
        }

        onActivated: {
            mainWindow.show()
            miniorWindow.show()
            miniorWindow.raise()
            miniorWindow.requestActivate()

        }
        menu: Menu {
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
        }
        Component.onCompleted: systemTrayIcon.show()
        function showReal(){
            icon.source = "qrc:/images/logo1.png"
            if(showMode !== true){
                showMode = true
            }
        }
        function showlucency() {
            icon.source = "qrc:/images/logo1.png"
            if(showMode !== false){
                showMode = false
            }
        }
    }



    Timer {
        id:showTimer
        interval: 1000
        repeat: true
        onTriggered: {
            if(systemTrayIcon.showMode === true){
                systemTrayIcon.showlucency()
            }else{
                systemTrayIcon.showReal()
            }
        }
    }
}
