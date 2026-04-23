import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    width: 800
    height: 600
    visible: true


    Rectangle{
        id:root
        width:100
        height:100
        state:"blue_color"

        states:[
            State{
                name:"red_color"
                PropertyChanges{
                    target:root
                    color:"red"
                    width:200
                }
            },
            State{
                name:"blue_color"
                PropertyChanges{
                    target:root
                    color:"blue"
                    height:200
                }
            }
        ]

        MouseArea{
            anchors.fill:parent
            onPressed:{
                root.state = "red_color"
            }
            onExited:{
                root.state = "blue_color"
            }
            onClicked:{
                animacolor.start()
                animaOpacity.start();
            }
        }

        PropertyAnimation{
            id:animacolor
            target:root
            properties:"color"
            to:"green"
            duration:1000
        }

        NumberAnimation{
            id:animaOpacity
            target:root
            property:"opacity"
            from:0.1
            to:1.0
            duration:200
            easing.type : Easing.InOutQuad
        }
    }
}