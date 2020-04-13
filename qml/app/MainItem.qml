import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.13
import "../component/"
Window {
    visible: true
    x:400
    y: 150
    width: 1022
    height: 672
    flags:Qt.FramelessWindowHint
    minimumWidth: 650

    Rectangle{
        id:mainBackRect
        anchors.fill: parent
        color: "#e9eef2"
        // 当窗口全屏时，设置边距为 0，则不显示阴影，窗口化时设置边距为 10 就可以看到阴影了
        anchors.margins:1


        ZVerticalMenu{
            id:testMenu
            onIndexChanged: {
                console.log(index)
                viewLoader.viewChanged()
            }

            Component.onCompleted: {
                console.log("加载成功")

            }
        }

        ZHeader{
            window: mainWindow
            id:mainHeaderRect
            width: parent.width - testMenu.width
            height: 50
            anchors.left: testMenu.right
            Rectangle{
                anchors.fill: parent

                Image {
                    id:mainItemIco
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter:parent.verticalCenter
                    source: "qrc:/images/main-logo.png"
                    sourceSize: Qt.size(207,29)
                }

                Rectangle{
                    id:userInfoRect
                    anchors.right: parent.right
                    anchors.rightMargin: 206
                    anchors.verticalCenter:parent.verticalCenter
                    ZAvatar{
                        id: userAvatar
                        width: 24
                        height: 24
                        anchors.verticalCenter:parent.verticalCenter
                        source: "qrc:/images/logo.png"
                    }
                    Text {
                        id: userName
                        anchors.left: userAvatar.right
                        anchors.leftMargin: 6
                        anchors.verticalCenter:parent.verticalCenter
                        text: globalStorage.username
                        font.bold: true
                        font.pixelSize: 14
                    }
                    ZSimpleButton{
                        id:mainItemXialaButton
                        width: 10
                        height: 10
                        anchors.left: userName.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter:parent.verticalCenter
                        icon.source: "qrc:/images/xiala.png"
                        onClicked: {
                            console.log(activated)
                            activated = !activated
                        }

                    }

                }

                Row{
                    anchors.right: parent.right
                    anchors.verticalCenter:parent.verticalCenter
                    ZIconButton{
                        width: 30
                        height: 30
                        icon.source: "qrc:/images/suoxiao.png"
                        onClicked: {
                            console.log("min")
                            mainHeaderRect.window.visible = false
                        }
                        checkedColor: "#FFFFFF"
                        noCheckedColor: "#FFFFFF"
                    }
                    ZIconButton{
                        id:maxButton
                        width: 30
                        height: 30
                        icon.source: "qrc:/images/fangda.png"

                        onClicked: {
                            console.log("max")
                            console.log(mainHeaderRect.window.visibility)
                            if(mainHeaderRect.window.visibility == 4){
                                showNormal()
                            }else{
                                showMaximized()
                            }
                        }
                        checkedColor: "#FFFFFF"
                        noCheckedColor: "#FFFFFF"
                    }
                    ZIconButton{
                        id:closeButton
                        width: 30
                        height: 30
                        icon.source: "qrc:/images/close.png"

                        onClicked: {
                            console.log("close")
                            mainHeaderRect.window.visible = false
                        }
                        checkedColor: "#FFFFFF"
                        noCheckedColor: "#FFFFFF"

                    }
                }
            }
        }

        Loader{
            width: parent.width - testMenu.width
            height: parent.height-mainHeaderRect.height
            anchors.left: testMenu.right
            anchors.top: mainHeaderRect.bottom
            id:viewLoader
            Component.onCompleted: {
                viewChanged()

                for(var index =0;index <pluginsManager.plugins.length;index ++){
                    console.log("pluginsManager.plugins")
                    console.log(pluginsManager.plugins[index]._name)
                }
            }

            function viewChanged(){
                if(testMenu.index === 0){
                    source = "qrc:/qml/app/PluginsView.qml"
                }
                else if (testMenu.index === 1){
                    source = "qrc:/qml/app/MsgView.qml"
                }
            }
        }

    }

    DropShadow {
        anchors.fill: mainBackRect
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        source: mainBackRect
        color: "#33333F"
        Behavior on radius { PropertyAnimation { duration: 100 } }
    }

}


