import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.13
import QtQuick.Controls.Styles 1.4
//import "../component"
import ZNModule 1.0
Window {
    id:loginItemWindow
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


    ZHeader{
        window: loginItemWindow
        id:loginHeaderRect
        width: parent.width
        height: 50
        //设置父窗口透明，子窗口不透明
        color: Qt.rgba(255,255,255,0)
        Rectangle{
            color: Qt.rgba(255,255,255,0)
            anchors.fill: parent
            Row{
                anchors.right: parent.right
                anchors.verticalCenter:parent.verticalCenter
                ZIconTextButton{
                    id:closeButton
                    width: 30
                    height: 30
                    icon.source: "qrc:/images/close.png"
                    onClicked: {
                        console.log("close")
                        loginHeaderRect.window.visible = false
                    }
                    checkedColor: "#FFFFFF"
                    noCheckedColor: "#FFFFFF"
                }
            }
        }
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
            id:loginUsername
            icon.source: "qrc:/images/denglu.png"
            content.placeholderText: "请输入账号"
            content.text: "fengtaizhengfu"
        }
        ZTextInput{
            id:loginPassword
            icon.source: "qrc:/images/mima.png"
            content.placeholderText: "请输入密码"
            content.echoMode: TextInput.Password
            content.text: "111111"
        }

        Row{
            spacing: 125

            ZCheckBox{
                id:autoLoginCheckBox
                text: qsTr("自动登录")
            }

            ZTextButton{
                width: 56
                height: 13
                label.text: "忘记密码"
                anchors.verticalCenter: parent.verticalCenter
            }

        }
        Text {
            width: 260
            height: 18
            id: loginErrorInfo
            visible: text
            text: qsTr(globalStorage.loginHintInfo)
            color: "red"
        }
        ZTextButton{
            width: 260
            height: 40
            rect.color: "#3053EB"
            label.text: "登录"
            label.color: "#F9FBFC"
            onClicked: {
                if((loginUsername.content.text)&&(loginPassword.content.text)){
                    graphqlclient.login(loginUsername.content.text,loginPassword.content.text)
                }else{
                    console.log("username or password is empty")
                }
            }
        }
        ZTextButton{
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
