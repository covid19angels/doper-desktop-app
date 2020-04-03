import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.13
import QtQuick.Controls.Styles 1.4
import "../component"
Window {
    visible: true
    x: 900
    y: 200
    width: 320
    height: 441
    flags:Qt.FramelessWindowHint

    Image {
        id: loginItemBackground
        fillMode: Image.TileHorizontally
        smooth: true
        source: "qrc:/images/denglubj.png"
    }
    ZSimpleButton{
        width: 12
        height: 13
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        icon.source: "qrc:/images/close.png"
    }
    Image {
        width: 87
        height: 100
        id: loginItemShuruiLogo
        anchors.left: parent.left
        anchors.leftMargin: 117
        anchors.top: parent.top
        anchors.topMargin: 60
        source: "qrc:/images/shuruilogo.png"
    }

    Column{
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 181
        ZTextInput{
            icon.source: "qrc:/images/denglu.png"
            content.placeholderText: "请输入账号"
        }
        ZTextInput{
            icon.source: "qrc:/images/mima.png"
            content.placeholderText: "请输入密码"
            content.echoMode: TextInput.Password
        }

        Row{
            spacing: 125

            ZCheckBox{
                id:autoLoginCheckBox
                text: qsTr("自动登录")
            }

            ZButton{
                width: 56
                height: 13
                label.text: "忘记密码"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        ZButton{
            width: 260
            height: 40
            rect.color: "#3053EB"
            label.text: "登录"
            label.color: "#F9FBFC"
        }
        ZButton{
            width: 260
            height: 40
            label.text: "注册"
        }

        ZCheckBox{
            id:agreeProtocolCheckBox
            text: qsTr("同意《服务条款》《隐私政策》")
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}
