import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

MouseArea{
    property string znType
    property string znShape
    property alias  label: _label
    property alias rect:_rect
    property bool   activated:false

    Rectangle {
        id : _rect
        anchors.fill: parent
//        Rectangle {
//            anchors.bottom: parent.bottom
//            visible: activated
//            width:  71
//            height: 2
//            //color: checkedFontColor
//            anchors.horizontalCenter: parent.horizontalCenter
//        }

    }

    Text {
        id:_label
        anchors.centerIn: parent
        font.pixelSize: 13
        font.weight: Font.Medium
    }

}
