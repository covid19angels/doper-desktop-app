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
        checked: index == 1
        width: parent.width/viewCount
        height: parent.height
        znSize: "custom"
        text: "通知（6）"
        color: "#FFFFFF"
        onClicked: {

            if(index != 1){
                index =1
            }
            console.log(index)
        }
    }
    ZButton{
        checked: index == 2
        width: parent.width/viewCount
        height: parent.height
        znSize: "custom"
        text: "消息（3）"
        color: "#FFFFFF"
        onClicked: {
            if(index != 2){
                index =2
            }
            console.log(index)
        }
    }
    ZButton{
        checked: index == 3
        width: parent.width/viewCount
        height: parent.height
        znSize: "custom"
        text: "代办（7）"
        color: "#FFFFFF"
        onClicked: {
            if(index != 3){
                index =3
            }
            console.log(index)
        }
    }
}
