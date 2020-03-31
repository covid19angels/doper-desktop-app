import QtQuick 2.0

MouseArea {
    property alias sourceSize: icon.sourceSize
    property alias source: icon.source
    property bool checked:true
    Image {
        id:icon
        anchors.centerIn: parent
    }
}
