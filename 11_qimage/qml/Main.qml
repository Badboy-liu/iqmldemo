import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window{
    id:window
    width:640
    height:480
    visible:true
    title:"qimage"
    Image{
        id:logoImage
        source: "qrc:/images/img.jpeg"
        anchors.centerIn:parent
        height:400
    }
}