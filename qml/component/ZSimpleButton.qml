import QtQuick 2.0

MouseArea {
    property alias icon: _icon
    property bool activated:false
    Image {
        id:_icon
        sourceSize: Qt.size(parent.width,parent.height)
        anchors.centerIn: parent
    }
}
