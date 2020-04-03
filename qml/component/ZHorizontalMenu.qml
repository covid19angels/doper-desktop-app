import QtQuick 2.0

Row {
    property int  viewCount :3
    property int  index: 1
    width: parent.width
    height: 42
    anchors.top: miniorHeaderRect.bottom
    anchors.left: miniorHeaderRect.left
    Component.onCompleted: {
        console.log("按钮的")
        console.log(parent.width/viewCount)
    }

    ZButton{
        activated: index == 1
        width: parent.width/viewCount
        height: parent.height
        label.font.bold: true
        label.text: "通知（6）"
        label.color: activated ?"#3D53C7":"#585B63"
        rect.color: "#FFFFFF"
        onClicked: {

            if(index != 1){
                index =1
            }
            console.log(index)
        }
        Rectangle {
            anchors.bottom: parent.bottom
            visible: parent.activated

            width:  71
            height: 2
            color: "#3855C9"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    ZButton{
        activated: index == 2
        width: parent.width/viewCount
        height: parent.height
        label.text: "消息（3）"
        label.color: activated ?"#3D53C7":"#585B63"
        label.font.bold: true
        rect.color: "#FFFFFF"
        onClicked: {
            if(index != 2){
                index =2
            }
            console.log(index)
        }
        Rectangle {
            anchors.bottom: parent.bottom
            visible: parent.activated

            width:  71
            height: 2
            color: "#3855C9"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    ZButton{
        activated: index == 3
        width: parent.width/viewCount
        height: parent.height
        label.text: "代办（7）"
        label.color: activated ?"#3D53C7":"#585B63"
        label.font.bold: true
        rect.color: "#FFFFFF"
        onClicked: {
            if(index != 3){
                index =3
            }
            console.log(index)
        }
        Rectangle {
            anchors.bottom: parent.bottom
            visible: parent.activated

            width:  71
            height: 2
            color: "#3855C9"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
