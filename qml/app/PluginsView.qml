import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../component"
Rectangle {
    id:pluginsViewRect
    width: parent.width
    height: parent.height
    color: "#EAEAEC"


    ListModel {
        id:pluginsDataModel
        ListElement{
            name:"组织架构"
            attributes:[
                ListElement {
                    name: "运营架构"
                    iamgeUrl: "qrc:/images/operating-structure.png"
                },
                ListElement {
                    name: "政府架构"
                    iamgeUrl: "qrc:/images/government-structure.png"
                },
                ListElement {
                    name: "员工管理"
                    iamgeUrl: "qrc:/images/staff-management.png"
                }
            ]
        }
        ListElement{
            name:"用户档案"
            attributes:[
                ListElement {
                    name: "用户查看"
                    iamgeUrl: "qrc:/images/user-view.png"
                },
                ListElement {
                    name: "新增用户"
                    iamgeUrl: "qrc:/images/add-user.png"
                }
            ]
        }
        ListElement{
            name:"运营管理"
            attributes:[
                ListElement {
                    name: "决策"
                    iamgeUrl: "qrc:/images/decision.png"
                },
                ListElement {
                    name: "资讯推送"
                    iamgeUrl: "qrc:/images/Information-push.png"
                },
                ListElement {
                    name: "广告位"
                    iamgeUrl: "qrc:/images/advertising-board.png"
                },
                ListElement {
                    name: "社区检查"
                    iamgeUrl: "qrc:/images/community-check.png"
                }
            ]
        }


    }


    TabView {
        //标签页按钮和下面的便签页视图整体
        id:pluginTabView
        width: parent.width
        height: parent.height
        style: TabViewStyle {
            //控制顶部按钮突出到下面主视图的部分
            frameOverlap: 0
            leftCorner:Rectangle {
                implicitWidth: 20
                implicitHeight: 43
                color:"#EAEAEC"
            }

            tab: Rectangle {
                //每一个标签按钮
                color: "#EAEAEC"
                border.color:  "#EAEAEC"
                implicitWidth: Math.max(name.width + 4, 96)
                implicitHeight: 43
                Rectangle{
                    color: {
                        //  styleData.selected?"#FFFFFF":"#EAEAEC"
                        if(styleData.selected){
                            return "#FFFFFF"
                        }else if(styleData.hovered){
                            return "#FFFFFF"
                        }else{
                            return "#EAEAEC"
                        }
                    }

                    width: 96
                    height: 33
                    anchors.bottom: parent.bottom
                    radius: 5
                    Text {
                        id: name
                        anchors.centerIn: parent
                        text: styleData.title
                        color: "#5D6169"
                        font.pixelSize: 15
                        font.bold: styleData.selected
                    }

                    Text {
                        visible: styleData.index
                        id: close
                        text: qsTr("×")
                        anchors.right:  parent.right
                        anchors.rightMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#5D6169"
                        MouseArea {
                            id :closeButton
                            anchors.fill: parent
                            onClicked: {
                                pluginTabView.removeTab(styleData.index)
                            }
                        }
                    }
                }
            }
            frame: Rectangle { color: "#F8F8FA" }
        }

        Tab {
            title: "工具箱"

            Rectangle{
                Image {
                    id: pluginsViewTopImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    sourceSize: Qt.size(822,164)
                    source: "qrc:/images/plugin-top.png"
                }

                Rectangle {
                    width: 300
                    height: 34
                    id:searchInputRect
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 204
                    color: "#FFFEFF"
                    border.color: "#E0E0E0"
                    radius: 20
                    TextInput{
                        text: "可输入搜索功能、用户、产品等"
                        font.bold: true
                        anchors.centerIn: parent
                        anchors.margins: 2
                        font.pointSize: 13
                        color: "#A6ACB1"
                        focus: true
                    }
                }

                Column{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 290
                    anchors.left: parent.left
                    anchors.leftMargin: 70

                    Repeater{
                        model: pluginsDataModel
                        Rectangle{
                            width: parent.width
                            height: 100
                            Text {
                                id:kindName
                                text: name
                                font.bold: true
                                font.pixelSize: 20
                            }
                            Grid{
                                id:kindContent
                                columns: 4
                                spacing: 86
                                anchors.top: kindName.bottom
                                anchors.topMargin: 20
                                Repeater {
                                    model: attributes
                                    MouseArea {
                                        width: 100; height: 40

                                        Image {
                                            id:iconImage
                                            sourceSize: Qt.size(40,40)
                                            source: iamgeUrl
                                        }
                                        Text {
                                            anchors.left: iconImage.right
                                            anchors.leftMargin: 8
                                            text: name
                                            anchors.verticalCenter: iconImage.verticalCenter
                                            font.bold: true
                                            font.pixelSize: 14
                                        }
                                        onClicked: {
                                            console.log(name,iamgeUrl)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
