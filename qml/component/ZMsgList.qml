import QtQuick 2.0

Rectangle{
    width: parent.width
    height: parent.height
    Component.onCompleted: {
        console.log("zmsglist insert")
    }

    Rectangle{
        id:headerInfoView
        width: parent.width
        height: 40
        color: "#FFF5EE"
        Text {
            text: qsTr("文件小助手")
            font.bold: true
            font.pointSize: 15
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 30

        }
    }

    Rectangle{
        id:msgListView
        width: parent.width
        height: 350
        anchors.top: headerInfoView.bottom
        anchors.topMargin: 0
        color: "#FFDAB9"

        ListModel {
            id:msgData
            ListElement {
                content: "555 3264"
                header:"qrc:/images/header.jpg"
                isme:true
            }
            ListElement {
                content: "1122你放假哦经济金发地积极的佛积极的佛几点睡觉澳服Joe文件发我杰尔夫我按揭我就发文件反扒皆无法家赔付金额均为票据发票金额为激发啤酒我案件发票金额为激发经纬评价安排较为翻盘局福牌阿胶无发票金额文件分配给金额怕我今晚加我就怕我见过"
                header:"qrc:/images/header.jpg"
                isme:false
            }
            ListElement {
                content: "555 0473"
                header:"qrc:/images/header.jpg"
                isme:true
            }
        }

        ListView {
            width: parent.width
            height: 200
            model: msgData
            delegate:  Rectangle{
                id: rectangle
                width: parent.width
                height: msgText.height>50?msgText.height:50
                color: msgListView.color
                ZAvatar {
                    id:headerAvatar
                    source: header
                    width: 50
                    height: 50
                    anchors.left: isme?undefined:parent.left
                    anchors.right: isme?parent.right:undefined
                }

                Text {
                    id:msgText
                    text: content
                    font.letterSpacing: 1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: isme?undefined:headerAvatar.right
                    anchors.right: isme?headerAvatar.left:undefined
                    width: 250
                    horizontalAlignment: isme?Text.AlignRight:Text.AlignLeft
                    wrapMode: Text.Wrap
                    maximumLineCount: 100
                    Component.onCompleted: {
                        console.log(contentWidth,contentHeight)
                    }
                }

            }
        }
    }

    Rectangle {
        id:inputView
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: msgListView.bottom
        anchors.topMargin: 0
        color: "#F0FFF0"

        Flickable{
            id:flick
            width: parent.width
            height: parent.height-30
            contentWidth: edit.paintedWidth
            contentHeight: edit.paintedHeight
            clip:true

            function ensureVisible(r)
            {
                if(contentX >= r.x){
                    contentX = r.x
                }else if(contentX + width <= r.x + r.width){
                    contentX = r.x+r.width-width
                }
                if(contentY >= r.y){
                    contentY = r.y
                }else if (contentY + height <= r.y + r.height){
                    contentY = r.y+r.height-height
                }
            }

            TextEdit{
                id:edit
                width: flick.width
                height: flick.height
                focus: true
                wrapMode: TextEdit.Wrap
                onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
            }

        }
        ZButton{
            label.text: "发送(s)"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
