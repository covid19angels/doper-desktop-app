import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import MySqlModel 1.0
import "../"
// 通知面板
Window {
    id:testWindow
    visible: true
    width: 320
    height: 480
    maximumWidth: 320
    maximumHeight: 480
    title: qsTr("测试窗口")

    SqlConversationModel {
        id:chatModel
        recipient: "zhangning"
    }
    ListView {
        width: 320; height: 480
        model:chatModel
        delegate: Rectangle{
            color: "#FFFEFF"
            width: parent.width
            height: 70
            //id, userName, eventMessage, dateTime
            Column{
                Text {
                    text: author
                }
                Text {
                    text: recipient
                }
                Button{
                    text: "发送"
                    onClicked: {
                        chatModel.sendMessage("zhangning","你好啊")
                    }
                }
            }
        }
    }

}



