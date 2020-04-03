import QtQuick 2.13

MouseArea {
    id: mouseArea
    //设置按钮和标签是水平还是垂直排布
    property string mode: "vertical"
    property alias  icon :_icon
    property alias  label:_label
    property bool   activated: false
    property string checkedColor: "#1d39c4"
    property string noCheckedColor: "#2f54eb"

    width: parent.width
    height:48


    //背景和左边竖线
    Rectangle{
        Rectangle {
            visible: activated
            height: parent.height
            width: 2
            color: "#ff9900"
        }
        anchors.fill: parent
        color: activated == true?checkedColor:noCheckedColor
    }
    //图标和文本，使用column布局，始终在水平方向居中
    Grid{
        spacing: 10
        //控制水平布局还是垂直布局
        columns: mode == "vertical"?1:0
        rows: mode == "horizontal"?1:0
        //控制按钮在按钮范围内水平垂直居中
        horizontalItemAlignment: Grid.AlignHCenter;
        verticalItemAlignment: Grid.AlignVCenter
        anchors.centerIn: parent
        Image {
            id:_icon
            visible: source
            sourceSize.height: 20
            sourceSize.width: 20
        }
        Text {
            visible: text!=""
            id: _label
            horizontalAlignment: Grid.AlignHCenter
        }
    }
}
