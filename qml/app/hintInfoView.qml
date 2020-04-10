import QtQuick 2.0

Rectangle{
    id:hintRect
    property alias text: hintRectText.text
    Text {
        anchors.centerIn: parent
        id: hintRectText
        font.bold: true
        font.pixelSize: 16
    }
}
