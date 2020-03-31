import QtQuick 2.0
import QtQuick.Window 2.12
Rectangle {

    property int mainWindowX //用来存储主窗口x坐标
    property int mainWindowY //存储窗口y坐标
    property int xMouse //存储鼠标x坐标
    property int yMouse //存储鼠标y坐标
    //背景mousearea,负责拖动和贴边隐藏实现
    property Window window
    property alias maxButtonVisible: maxButton.visible
    property alias userInfoRectVisible: userInfoRect.visible
    Rectangle{
        anchors.fill: parent

        Image {
            id:mainItemIco
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter:parent.verticalCenter
            source: "qrc:/images/logo.png"
            width: 207
            height: 29
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
                source: "qrc:/images/header.jpg"
            }
            Text {
                id: userName
                anchors.left: userAvatar.right
                anchors.leftMargin: 6
                anchors.verticalCenter:parent.verticalCenter
                text: "小张总"
                font.bold: true
                font.pixelSize: 14
            }
            ZSimpleButton{
                width: 10
                height: 10
                sourceSize.height: 8
                sourceSize.width: 8
                anchors.left: userName.right
                anchors.leftMargin: 10
                anchors.verticalCenter:parent.verticalCenter
                source: checked?"qrc:/images/bottom.png":"qrc:/images/right.png"
                onClicked: {
                    console.log(checked)
                    checked = !checked
                }

            }

        }

        Row{
            anchors.right: parent.right
            anchors.verticalCenter:parent.verticalCenter
            ZIconButton{
                width: 30
                height: 30
                source: "qrc:/images/min.svg"
                onClicked: {
                    console.log("min")
                    window.visible = false
                }
                checkedColor: "#FFFFFF"
                noCheckedColor: "#FFFFFF"
            }
            ZIconButton{
                id:maxButton
                width: 30
                height: 30
                source: "qrc:/images/max.png"

                onClicked: {
                    console.log("max")
                    console.log(window.visibility)
                    if(window.visibility == 4){
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
                source: "qrc:/images/close.svg"

                onClicked: {
                    console.log("close")
                }
                checkedColor: "#FFFFFF"
                noCheckedColor: "#FFFFFF"

            }
        }
    }

    MouseArea {
        //为窗口添加鼠标事件
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        hoverEnabled: true
        propagateComposedEvents: true

        onPressed: { //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: {
            //鼠标按下后改变位置
            if(pressed === true){
                //鼠标偏移量
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                //如果mainwindow继承自QWidget,用setPos
                window.setX(window.x+delta.x)
                window.setY(window.y+delta.y)
                if(window.y <= 0 ){
                    window.y = 0
                }
            }
        }
    }

}
