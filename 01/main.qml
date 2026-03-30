import QtQuick
import QtQuick.Controls

ApplicationWindow{
    width: 640
    height: 480
    visible: true

    menuBar:MenuBar{
        Menu{
            title:qsTr("file")
            Action{
                text:qsTr("1")
                onTriggered: stackView.push(page1)
            }
            Action{
                text:qsTr("2")
                onTriggered: stackView.push(page2)
            }
            MenuSeparator{}
            Action{
                text: qsTr("Exit")
                onTriggered: Qt.quit()
            }
        }
    }
    header:ToolBar{
        Row{
            spacing:10
            anchors.verticalCenter:parent.verticalCenter
            Button{
                text:"Back"
                onClicked:stackView.pop()
            }
            Label{
                text:qsTr("Toolbar")
            }
        }

    }
    footer:TabBar{
        id:tabBar
        TabButton{
            text:"page1"
            onClicked:stackView.replace(page1)
        }
        TabButton{
            text:qsTr("page2")
            onClicked:stackView.replace(page2)
        }
    }
    StackView{
        id:stackView
        anchors.fill:parent
        initialItem:page1
    }
    Component{
        id:page1
        Rectangle{
            // color:"red"
            Text{
                anchors.centerIn: parent
                text:"this is page1"
            }
        }
    }
    Component{
        id:page2
        Rectangle{
            // color:"blue"
            Text{
                anchors.centerIn: parent
                text:"this is page2"
            }
        }
    }
}