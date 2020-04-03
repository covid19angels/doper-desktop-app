import QtQuick 2.13
import QtQuick.Controls 2.5
Rectangle{
    width: 260
    height: 40
    color: "#FFFEFF"
    border.color: "#E0E0E0"
    radius: 3
    property alias icon: _icon
    property alias content: _content
//    Row{
//        leftPadding: 11
//        spacing: 10
//        anchors.verticalCenter: parent.verticalCenter
////        Image {

////            width: 11
////            height: 16
////            id: _icon

////        }

        TextField{
            width: 260
            height: 40
            id:_content
            font.pointSize: 14
            focus: true
            leftPadding:32
            background: Rectangle {

                border.color: "#E0E0E0"
                Image {
                    x:11
                    y:13
                    width: 11
                    height: 16
                    anchors.verticalCenter: parent.verticalCenter
                    id: _icon

                }
            }
        }
//    }
}
