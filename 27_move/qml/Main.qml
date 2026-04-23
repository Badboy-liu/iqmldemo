import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    width: 800
    height: 600
    visible: true


    Column{
        spacing:10
        padding:10
        Rectangle{
            color:"red"
            width:50
            height:50
        }
        Rectangle{
            id:greenRectangle
            color:"green"
            width:50
            height:50
        }
        Rectangle{
            color:"blue"
            width:50
            height:50
        }

        move:Transition{
            NumberAnimation{
                properties:"x,y"
                duration:500
                easing.type:Easing.InOutQuad
            }
        }
        focus:true
        Keys.onSpacePressed:{
            greenRectangle.visible =!greenRectangle.visible
        }
    }

}