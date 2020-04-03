import QtQuick 2.0
import QtGraphicalEffects 1.13
Rectangle {
    width: 100
    height: 100
    radius: width/2

    property alias source:_image.source
    //图片的体积取决于rectangle的面积
    Image {
        id: _image
        smooth: true
        visible: false
        anchors.fill: parent
        sourceSize: Qt.size(parent.size, parent.size)
        antialiasing: true
    }
    Rectangle {
        id: _mask
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
