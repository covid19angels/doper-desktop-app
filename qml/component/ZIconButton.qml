import QtQuick 2.0

MouseArea {
    id: mouseArea
    property string znMode: "vertical"
    property alias source :icon.source
    property alias text:name.text
    property alias textColor : name.color
    property bool checked: false
    property string checkedColor: "#1d39c4"
    property string noCheckedColor: "#2f54eb"
    property alias iconOpacity: icon.opacity
    width: parent.width
    height:48



    Rectangle{
        Rectangle {
            visible: checked
            height: parent.height
            width: 2
            color: "#ff9900"
        }
        anchors.fill: parent
        color: checked == true?checkedColor:noCheckedColor
    }

    Image {
        id:icon
        visible: source
        sourceSize.height: 20
        sourceSize.width: 20
        anchors.centerIn: parent
    }
    Text {
        visible: text!=""
        id: name
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: icon.bottom
    }
}
