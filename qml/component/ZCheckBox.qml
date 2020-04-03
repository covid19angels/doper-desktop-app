import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox {
    id: _checkBox
    text: qsTr("自动登录")
    checked: true

    indicator: Rectangle {
        implicitWidth: 13
        implicitHeight: 13
        x: 0
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: _checkBox.down ? "#D9D9D9" : "#D9D9D9"

        Rectangle {
            width: 9
            height: 9
            x: 2
            y: 2
            radius: 2
            color: _checkBox.down ? "#D9D9D9" : "#D9D9D9"
            visible: _checkBox.checked
        }
    }

    contentItem: Text {
        text: _checkBox.text
        opacity: enabled ? 1.0 : 0.3
        color: _checkBox.down ? "#212329" : "#212329"
        verticalAlignment: Text.AlignVCenter
        leftPadding:  _checkBox.spacing
        font.pixelSize: 13
    }
    spacing: 12
}
