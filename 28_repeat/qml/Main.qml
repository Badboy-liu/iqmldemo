import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    width: 800
    height: 600
    visible: true

    Flickable{
        anchors.fill:parent
        contentHeight:gridLayout.height
        contentWidth:gridLayout.width
        clip:true
        Grid{
            id:gridLayout
            spacing:10
            rows:25
            columns:1
            width:50
            Repeater{
                model:25
                Rectangle{
                    width:50
                    height:50
                    color:"yellow"
                    border.color:"orange"
                    Text{
                        text:index
                        font.pointSize:32
                        anchors.centerIn:parent
                        color:"green"
                    }
                }
            }
        }
        ScrollBar.vertical:ScrollBar{
            policy:ScrollBar.AsNeeded
        }
    }


}