import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

MouseArea{
    property string znType
    property string znSize: "default"
    property string znShape
    property alias  text:buttonText.text
    property string color: "#1890ff"
    property bool   checked:false
    property string noCheckedfontColor: "#000000"
    property string checkedFontColor: "#3E55CD"
    Component.onCompleted: {
        if(znSize == "large"){
            width = 90
            height = 40
        }else if (znSize == "small"){
            width = 50
            height = 20
        }else if (znSize == "custom") {

        }else{
            width = 70
            height = 30
        }
    }

    Rectangle {
        anchors.fill: parent
        color: color
        radius: 5
        Rectangle {
            anchors.bottom: parent.bottom
            visible: checked
            width:  parent.width
            height: 2
            color: checkedFontColor
        }
    }

    Text {
        id:buttonText
        color: checked?checkedFontColor:noCheckedfontColor
        anchors.centerIn: parent
    }

}
