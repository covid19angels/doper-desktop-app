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
            maxButtonVisible: true
//            source: mainItemHeaderConponent
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


