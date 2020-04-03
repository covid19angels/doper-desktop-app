import QtQuick 2.0
import QtQuick.Window 2.12

Rectangle {

    property int mainWindowX //用来存储主窗口x坐标
    property int mainWindowY //存储窗口y坐标
    property int xMouse //存储鼠标x坐标
    property int yMouse //存储鼠标y坐标
    //背景mousearea,负责拖动和贴边隐藏实现
    property Window window

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
