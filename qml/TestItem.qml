import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import MySqlModel 1.0
import "./component"
// 通知面板
Window {
    id:testWindow
    visible: true
    width: 320
    height: 480
    maximumWidth: 320
    maximumHeight: 480
    title: qsTr("测试窗口")
    Column {
        ZAvatar{
            source: "qrc:/images/header.jpg"

            height: 40
            width: 40
        }
        ZIconButton{
            width: 100
            height: 50
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/add-account.png"
            label.text: "坐席登录"
            label.color: "#FFFFFF"
            mode: "horizontal"
            onClicked: {
                console.log("我是设置页面")
            }
        }

        ZIconButton{
            width: 100
            height: 50
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/add-account.png"
            label.color: "#FFFFFF"
            mode: "vertical"
            label.text: "垂直按钮"
            onClicked: {
                console.log("我是设置页面")
            }
        }
        ZSimpleButton{
            width:  20
            height: 20
            icon.source: "qrc:/images/xiala.png"
            onClicked: {
                console.log(activated)
                activated = !activated
            }

        }
    }


}



