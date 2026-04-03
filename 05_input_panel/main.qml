import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard
Window{
    id:window
    width:640
    height:480
    title:qsTr("hello world")

    Column{
        anchors.centerIn:parent
        spacing:20

        TextField{
            width:200
            placeholderText:"点击我弹键盘"
        }
        TextField{
            width:200
            placeholderText:"再来一个输入框"
        }
    }

    InputPanel{
        id:inputPanel
        z:99
        width:parent.width
        y:window.height

        states:State{
            name:"visible"
            when:inputPanel.active
            PropertyChanges{
                target:inputPanel
                y:window.height - inputPanel.height
            }
        }

        transitions:Transition{
            from:""
            to:"visible"
            reversible:true
            NumberAnimation{
                properties:"y"
                duration:250
                easing.type:Easing.InOutQuad
            }
        }
    }
}
