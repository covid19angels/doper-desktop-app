import QtQuick 2.13
import "../component"
Rectangle{
    width: 302
    height: 314



    ListModel{
        id:miniorMsgListviewModel
        ListElement{
            avatar:"qrc:/images/header.jpg"
            content:"你收到了来自王先生的订单"
            time: "5分钟前"
            avatarColor:"#42ABFF"

        }
        ListElement{
            avatar:"qrc:/images/header.jpg"
            content:"父亲进入了幸福驿站"
            time: "15分钟前"
             avatarColor:"#FFC641"
        }
        ListElement{
            avatar:"qrc:/images/header.jpg"
            content:"母亲血压偏高报警"
            time: "2小时前"
             avatarColor:"#FE4F51"
        }
        ListElement{
            avatar:"qrc:/images/header.jpg"
            content:"奶奶体温监测为37度"
            time: "1天前"
            avatarColor:"#42CCCF"
        }
        ListElement{
            avatar:"qrc:/images/header.jpg"
            content:"您下单的保洁服务已完成"
            time: "一天前"
             avatarColor:"#FDC83F"
        }
    }
    ListView{
        width:  parent.width
        height: parent.height
        model:  miniorMsgListviewModel
        delegate: Rectangle{
            width: parent.width
            height: 61
            Rectangle{
                width: 255
                height: 1
                color: "#DEDEDE"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row{
                leftPadding: 23
                topPadding: 14
                spacing: 14
                Rectangle{
                   radius: width/2
                   height:  29
                   width: 29
                   color: avatarColor
                }
                Column{
                    spacing: 9
                    Text {
                        text: content
                        font.bold: true
                        font.pixelSize: 13
                    }
                    Text {
                        text: time
                        font.pixelSize: 12
                    }
                }
            }
        }
    }
}
