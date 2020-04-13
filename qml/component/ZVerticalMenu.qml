import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    width: 60
    height: parent.height
    color: "#2f54eb"
    property int index: 0
    //左侧垂直导航栏
    Column{
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 50
        ZIconButton{
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/all-fill.png"
            activated: index == 0
            onClicked: {
                if(index != 0){
                    index = 0
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            icon.opacity:  activated | containsMouse?1:0.8
            icon.source:  "qrc:/images/icon-chat.png"
            activated: index == 1
            onClicked: {
                if(index != 1){
                    index = 1
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/salescenter-fill.png"
            activated: index == 2
            onClicked: {
                if(index != 2){
                    index = 2
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/namecard-fill.png"
            activated: index == 3
            onClicked: {
                if(index != 3){
                    index = 3
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
           icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/default-template-fill.png"
            activated: index == 4
            onClicked: {
                if(index != 4){
                    index = 4
                }
            }
        }

        ZIconButton{
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/calculator-fill.png"
            activated: index == 6
            onClicked: {
                if(index != 6){
                    index = 6
                }
            }
        }
        ZIconButton{
            hoverEnabled: true
            icon.opacity: activated | containsMouse?1:0.8
            icon.source: "qrc:/images/add-account.png"
            activated: index == 7
            onClicked: {
                if(index != 7){
                    index = 7
                }
            }
        }
    }

    ZIconButton{
        hoverEnabled: true
        icon.opacity: activated | containsMouse?1:0.8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 41
        anchors.horizontalCenter: parent.horizontalCenter
        icon.source: "qrc:/images/service.png"
        label.text: "坐席登录"
        label.color: "#FFFFFF"
        onClicked: {
            console.log("我是设置页面")
            graphqlclient.quit()
        }
    }


}
