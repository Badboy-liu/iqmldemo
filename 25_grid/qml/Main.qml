import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    width: 800
    height: 600
    visible: true

    Grid {
        anchors.fill:parent
        columns:3
        spacing:2

        Repeater{
            model:["red","blue","cyan","green"]
            delegate:Rectangle{
                color:modelData
                width:50
                height:50
                radius:5
            }
        }

        // Rectangle{
        //     color:"green"
        //     width:50
        //     height:50
        //
        // }
        // Rectangle{
        //     color:"blue"
        //     width:50
        //     height:50
        // }
        // Rectangle{
        //     color:"cyan"
        //     width:50
        //     height:50
        // }
    }
}