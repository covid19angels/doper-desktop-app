import QtQuick 2.0
import QtQuick.Layouts 1.3
import "../component"
Rectangle{
    width: parent.width
    height: parent.height

    ZRoomList{
        id:roomList
        width: 180
        color: "#F0FFFF"
        height: parent.height
    }
    ZMsgList{
        id:msgList
        anchors.left: roomList.right
        width: parent.width-roomList.width
    }
}
