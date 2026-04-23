import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    width: 800
    height: 600
    visible: true

    MouseArea {
        anchors.fill: parent
        onPressed: {
            column1.spacing = 20
        }

        onReleased: {
            column1.spacing = 10
        }
    }

    Row {
        id: row1
        spacing: 10
        Rectangle {
            color: "red"
            width: 50
            height: 50
        }
        Rectangle {
            color: "green"
            width: 20
            height: 50
        }
        Rectangle {
            color: "blue"
            width: 50
            height: 20
        }
    }

    Column {
        id: column1
        anchors.top: row1.bottom
        spacing: 10
        Rectangle {
            color: "blue"
            width: 50
            height: 20
        }
        Rectangle {
            color: "red"
            width: 50
            height: 50
        }
        Rectangle {
            color: "green"
            width: 20
            height: 50
        }
    }
}