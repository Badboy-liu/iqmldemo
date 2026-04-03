import QtQuick.Controls
import QtQuick

import QtQuick.Layouts
import MyMessage 1.0
Window{
    id:window
    width:640
    height:480
    visible:true
    title:qsTr("hello world")

    Component.onCompleted:{
        console.log(Message.Ready)
        console.log(Message.StatusA.Ready)
        console.log(msg)

    }
    Component.onDestruction: {
        console.log("组件销毁")
    }
    property bool status:ui.status

    onStatusChanged:{
        statusRect.color = status?"limegreen":"red"
    }

    // Connections{
    //     target:ui
    //
    //     function onUpdateTime(time){
    //         timeLabel.text = time
    //     }
    // }

    RowLayout{
        id:row1
        spacing:10

        Button{
            id:addButton2
            width:100
            height:50
            text:"+"
            font.pixelSize:32
            onClicked:{
                ui.level++
            }
        }

        Label{
            id:label2
            horizontalAlignment:Text.AlignHCenter
            verticalAlignment:Text.AlignVCenter
            font.pixelSize:32
            font.bold:true
            color:"blue"
            text:ui.level
        }

        Button{
            id:subButton2
            text:"-"
            font.pixelSize:32
            onClicked:{
                ui.level--
            }
        }
    }

    RowLayout{
        id:row2
        anchors.top:row1.bottom
        spacing:10
        Label{
            id:timeLabel
            horizontalAlignment:Text.AlignHCenter
            verticalAlignment:Text.AlignVCenter
            color:"black"
            font.pixelSize:32
            font.bold:true
            text:ui.time
        }

        Rectangle{
            id:statusRect
            width:100
            height:100
            radius:height/2
            color:"limegreen"
            border.color:"black"
        }
    }

    Message{
        id:msg
        onValueChanged:function(value){
            console.log("value = "+value)
            value++

        }
    }


    RowLayout{
        id:row3
        anchors.top:row2.bottom
        spacing:10
        Button{
            id:addButton3
            width:100
            height:50
            text:"+"
            font.pixelSize:32
            onClicked:{
                msg.value++
            }
        }
        Label{
            id:label3
            horizontalAlignment:Text.AlignHCenter
            verticalAlignment:Text.AlignVCenter
            font.pixelSize:32
            font.bold:true
            color:"red"
            text:msg.value
        }

        Button{
            id:subButton3
            text:"-"
            font.pixelSize:32
            onClicked:{
                msg.value--
            }
        }
    }
}
