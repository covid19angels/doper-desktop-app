import QtQuick 2.13
import QtQuick.Window 2.12
import "../"
Rectangle {
    width: parent.width
    height: parent.height
    ListModel {
        id:dataModel

        ListElement {
            name: "聊天信息"
            type: "qml"
            path: "qrc:/qml/deeplink/ChatView.qml"
            param:"我是传给聊天信息的数据"

        }
        ListElement {
            name: "任务信息"
            type: "qml"
            path: "qrc:/qml/deeplink/TaskView.qml"
            param:""
        }
        ListElement {
            name: "物流信息"
            type: "qml"
            path: "qrc:/qml/deeplink/ExpressView.qml"
            param:""
        }
    }

    ListView {
        width: 180; height: 200

        model: dataModel
        delegate: ZButton{
            text: name
            onClicked: {
                console.log(name)
                var component = Qt.createComponent(path);
                if (component.status === Component.Ready) {
                    var exam = component.createObject(rootWindow);
                    exam.sendParam(param)
                }
            }
        }
    }
}

