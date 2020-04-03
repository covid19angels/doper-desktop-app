import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.13
import "../component"
import "../app"

// 通知面板
Window {

    visible: true
    x:1450
    y:150
    width: 302
    height: 400
    maximumWidth: 302
    maximumHeight: 400
    flags:Qt.FramelessWindowHint
    property int mainWindowX //用来存储主窗口x坐标
    property int mainWindowY //存储窗口y坐标
    property int xMouse //存储鼠标x坐标
    property int yMouse //存储鼠标y坐标


    Rectangle{
        id:miniorBackRect
        anchors.fill: parent
        color: "#e9eef2"
        // 当窗口全屏时，设置边距为 0，则不显示阴影，窗口化时设置边距为 10 就可以看到阴影了
        anchors.margins:1


        ZHeader{
            id:miniorHeaderRect
            width: parent.width
            height: 42
            Rectangle{
                anchors.fill: parent

                Image {
                    id:mainItemIco
                    anchors.left: parent.left
                    anchors.leftMargin: 9
                    anchors.verticalCenter:parent.verticalCenter
                    source: "qrc:/images/logo1.png"
                    width: 29
                    height: 29
                }
                Text{
                    text: qsTr("DOPER")
                    font.bold: true
                    font.pixelSize: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 45
                    anchors.verticalCenter:parent.verticalCenter
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
                            miniorHeaderRect.window.visible = false
                        }
                        checkedColor: "#FFFFFF"
                        noCheckedColor: "#FFFFFF"
                    }
//                    ZIconButton{
//                        id:maxButton
//                        width: 30
//                        height: 30
//                        icon.source: "qrc:/images/max.png"

//                        onClicked: {
//                            console.log("max")
//                            console.log(window.visibility)
//                            if(window.visibility == 4){
//                                showNormal()
//                            }else{
//                                showMaximized()
//                            }
//                        }
//                        checkedColor: "#FFFFFF"
//                        noCheckedColor: "#FFFFFF"
//                    }
                    ZIconButton{
                        id:closeButton
                        width: 30
                        height: 30
                        icon.source: "qrc:/images/close.png"

                        onClicked: {
                            console.log("close")
                            miniorHeaderRect.window.visible = false
                        }
                        checkedColor: "#FFFFFF"
                        noCheckedColor: "#FFFFFF"

                    }
                }
            }
        }

        ZHorizontalMenu{
            id:miniorHorizontalMenu
        }

        Loader{
            anchors.top: miniorHorizontalMenu.bottom
            width: parent.width
            anchors.bottom: parent.bottom
            source: "qrc:/qml/app/MiniorMsgList.qml"
        }
    }
    DropShadow {
        anchors.fill: miniorBackRect
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        source: miniorBackRect
        color: "#33333F"
        Behavior on radius { PropertyAnimation { duration: 100 } }
    }


    //背景mousearea,负责拖动和贴边隐藏实现
        MouseArea {
            //为窗口添加鼠标事件
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton //只处理鼠标左键
            property point clickPos: "0,0"
            hoverEnabled: true
            propagateComposedEvents: true
            onClicked: {
    //            console.log("clicked main mousearea")
                mouse.accepted = false
            }
            onEntered: {
                console.log("entered")
                //itemNotificationHome.height = itemNotificationHome.parent
                miniorWindow.height = 400
            }
            onExited: {
                console.log("exited")
                if(miniorWindow.y <= 0 ){
                    miniorWindow.y = 0
                    miniorWindow.height = 1;
                }
            }
            onPressed: { //接收鼠标按下事件
                clickPos  = Qt.point(mouse.x,mouse.y)
            }
            onPositionChanged: {
                //鼠标按下后改变位置
                if(pressed === true){
                    //鼠标偏移量
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    //如果mainwindow继承自QWidget,用setPos
                    miniorWindow.setX(miniorWindow.x+delta.x)
                    miniorWindow.setY(miniorWindow.y+delta.y)
                    if(miniorWindow.y <= 0 ){
                        miniorWindow.y = 0
                    }
                }
            }
        }

}



