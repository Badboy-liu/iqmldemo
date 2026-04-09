import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

Window{
    width:640
    height:480

    visible:true

    title:qsTr("hello world")


    signal  msgRcv(string person,string notice)

    Component.onCompleted:{
        // msgRcv.connect(sendToPost,sendToPost2)
        msgRcv.connect(sendToPost)
        msgRcv.connect(sendToPost2)
    }

    function  sendToPost(person,notice){
        console.log("sendToPost>> person:"+person+" notice: "+notice)
    }
    function sendToPost2(person,notice){
        console.log("sendToPost2>> person:"+person+" notice:"+notice)
    }


    Button{
        id:button
        width:200
        height:100
        text:"button"
        font.pixelSize:30
        onClicked:{
            msgRcv("Alice","hello from button1")
        }
    }

}
