import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window{
    width:800
    height:600
    visible:true


    Flickable{
        id:flickable
        anchors.fill:parent
        contentWidth:textEdit.width
        contentHeight:textEdit.height
        clip:true

        TextEdit{
            id:textEdit
            width:flickable.width
            height:Math.max(flickable.height,implicitHeight)
            wrapMode:TextEdit.Wrap
            focus:true
            text:"在这里输入文本.."
            font.pixelSize:16
            selectByMouse:true
            selectByKeyboard:true

            onTextChanged:{
                flickable.contentHeight = textEdit.implicitHeight

            }
        }

        ScrollBar.vertical:ScrollBar{
            policy:ScrollBar.AsNeeded
        }
    }
}