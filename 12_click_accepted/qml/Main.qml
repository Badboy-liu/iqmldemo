import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.VirtualKeyboard
import App
Window {
    id: winodw
    width: 640
    height: 480
    visible: true
    title: qsTr("hello")
    color: "gray"

    Rectangle {
        height: 100
        width: 100
        // anchors.centerIn:parent
        MouseArea {
            anchors.fill: parent
            onPressed: {
                console.log("press A")
            }

            onClicked: {
                console.log("click A")
            }


        }
    }


    Rectangle {
        width: 100
        height: 100
        // anchors.centerIn:parent
        MouseArea {
            anchors.fill: parent
            enabled: false
            onPressed: function (mouse) {
                console.log("press B")
                // mouse.accepted = false
            }

            onClicked: function (mouse) {
                console.log("click B")
                mouse.accepetd = false
            }
            propagateComposedEvents: true
        }
    }

}


