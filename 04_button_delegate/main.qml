import QtQuick
import QtQuick.Controls

Window{
    width:640
    height:480
    visible:true
    title:qsTr("hello world")


    ListView{
        anchors.centerIn:parent
        width:140
        height:240
        model:["option1","option2","option3"]
        x:20
        y:20
        delegate:CheckDelegate{
            text:modelData
            onCheckedChanged:{
                console.log(modelData+":"+checked)
            }
        }
    }
}