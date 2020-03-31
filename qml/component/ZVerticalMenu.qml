import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    width: 60
    height: parent.height
    color: "#2f54eb"
    property int index: 0

    Column{
        spacing: 0
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/all-fill.png"
            checked: index == 0
            onClicked: {
                if(index != 0){
                    index = 0
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/icon-chat.png"
            checked: index == 1
            onClicked: {
                if(index != 1){
                    index = 1
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/salescenter-fill.png"
            checked: index == 2
            onClicked: {
                if(index != 2){
                    index = 2
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/namecard-fill.png"
            checked: index == 3
            onClicked: {
                if(index != 3){
                    index = 3
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/default-template-fill.png"
            checked: index == 4
            onClicked: {
                if(index != 4){
                    index = 4
                }
            }
        }

        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/calculator-fill.png"
            checked: index == 6
            onClicked: {
                if(index != 6){
                    index = 6
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            iconOpacity: checked | containsMouse?1:0.8
            source: "qrc:/images/add-account.png"
            checked: index == 7
            onClicked: {
                if(index != 7){
                    index = 7
                }
            }
        }
    }

    ZIconButton{
        hoverEnabled: true
        iconOpacity: checked | containsMouse?1:0.8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 41
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/images/add-account.png"
        text: "坐席登录"
        textColor: "#FFFFFF"
        onClicked: {
            console.log("我是设置页面")
        }
    }


}
