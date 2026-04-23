import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window{
    width:800
    height:600
    visible:true

    Rectangle{
        id:textInputRectangle1
        width:300
        height:50
        color:"lightblue"
        anchors.centerIn:parent
        radius:5

        TextInput{
            id:textIput1
            anchors.fill:parent
            anchors.centerIn:parent
            font{
                pixelSize:32
                bold:true
            }
            focus:true

            verticalAlignment:Text.AlignVCenter
            leftPadding:10
            rightPadding:10
            clip:true

            onEditingFinished:{
                console.log(text)
            }
        }
    }

    Rectangle{
        id:textInputRectangle2
        width:300
        height:50
        color:"lightgreen"
        anchors.top:textInputRectangle1.bottom
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin:10
        radius:5


        TextInput{
            id:textInput
            anchors.fill:parent
            font{
                pixelSize:32
                bold:true
            }
            focus:true

            verticalAlignment:Text.AlignVCenter
            leftPadding:5
            rightPadding:5
            clip:true

            echoMode:TextInput.Password
            maximumLength:12
            onTextEdited:{
                if (text=="2024"){
                    console.log("is 2024")
                }
            }
        }
    }
}