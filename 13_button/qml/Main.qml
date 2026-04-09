import QtQuick.Controls
import QtQuick.Layouts
import QtQuick


Window{
    width:640
    height:480
    title:qsTr("hello world")
    visible:true

    Rectangle{
        id:redRectangle
        width:200
        height:200
        color:"red"
        anchors.centerIn:parent
    }

    Rectangle{
        id:blueRectangele
        width:redRectangle.width/2
        height:redRectangle.height/2
        color:"blue"
        radius:height/2
        x:10
        y:10
    }

    Button{
        id:okButton
        width:150
        height:60
        text:"OK"
        font.pixelSize:32
        font.bold:true
        anchors.bottom:parent.bottom
        anchors.bottomMargin:10
        anchors.horizontalCenter:parent.horizontalCenter
        onClicked:{
            console.log("OK")
            blueRectangele.width+=10
            console.log("width:"+redRectangle.width)
        }
    }
}
