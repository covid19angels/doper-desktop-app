import QtQuick 2.0
import QtGraphicalEffects 1.13
Rectangle {
        width: 100
        height: 100
        radius: width/2
        color: "black"

        property alias source:_image.source

        Image {
            id: _image
            smooth: true
            visible: false
            anchors.fill: parent
            source: "./testPic.jpg"
            sourceSize: Qt.size(parent.size, parent.size)
            antialiasing: true
        }
        Rectangle {
            id: _mask
            color: "black"
            anchors.fill: parent
            radius: width/2
            visible: false
            antialiasing: true
            smooth: true
        }
        OpacityMask {
            id:mask_image
            anchors.fill: _image
            source: _image
            maskSource: _mask
            visible: true
            antialiasing: true
        }
    }
