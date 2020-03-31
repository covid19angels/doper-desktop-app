import QtQuick 2.0

Rectangle{
        ListModel {
            id:data
            ListElement {
                name: "Bill Smith"
                number: "555 3264"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "John Brown"
                number: "555 8426"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                header:"qrc:/images/header.jpg"
            }

        }

        ListView {
            width: 180; height: parent.height
            model: data
            clip: true
            delegate:  Row{
                Image {
                    source: header
                    width: 50
                    height: 50
                }
                Column{
                    spacing: 5
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        text: name
                        font.pointSize: 15
                        font.bold: true
                    }
                Text {
                    text: number
                }
            }
        }
    }
}





