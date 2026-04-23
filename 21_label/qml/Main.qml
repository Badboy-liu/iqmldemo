import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window{
    width:800
    height:600
    visible:true

    Label{
        id:myLabel
        text:"this is a label with topInset!"
        font.pixelSize:20
        color:"blue"
        background:Rectangle{
            color:"lightgray"
            radius:5
        }
        width:300
        height:100
        anchors.centerIn:parent

        topInset:-20
        leftInset:-20
    }
}