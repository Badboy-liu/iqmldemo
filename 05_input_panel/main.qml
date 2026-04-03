import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard
import QtQuick.VirtualKeyboard.Settings

Window{
    id:window
    width:640
    height:480
    visible: true
    title:qsTr("hello world")
    MouseArea {
        anchors.fill: parent
        z: -1   // 在最底层，不影响点击控件

        onClicked: {
            Qt.inputMethod.hide()   // ⭐关键
            window.activeFocusItem.focus =false
        }
    }
    Component.onCompleted: {
        VirtualKeyboardSettings.selectionHandlesVisible = false
        Qt.inputMethod.show()
    }

    Column{
        anchors.centerIn:parent
        spacing:20

        TextField{
            width:200
            height:40
            placeholderText:"点击我弹键盘"
            // focus: true
        }
        TextField{
            width:200
            height:40
            placeholderText:"再来一个输入框"
        }
    }

    InputPanel{
        id:inputPanel
        z:99
        width:parent.width
        y:visible ? window.height - height : window.height
        Component.onCompleted: {
            console.log("IM visible:", Qt.inputMethod.visible)
        }
        // ⭐⭐关键：绑定输入法
        visible: Qt.inputMethod.visible

        // ⭐ 就加在这里
        onActiveChanged: {
            console.log("keyboard active:", active)
        }
        states: State {
            name:"visible"
            when:inputPanel.active
            PropertyChanges{
                target:inputPanel
                y:window.height - inputPanel.height
            }
        }

        transitions: Transition {
            from:""
            to:"visible"
            reversible:true
            NumberAnimation{
                properties:"y"
                duration:250
                easing.type: Easing.InOutQuad
            }
        }
    }
}