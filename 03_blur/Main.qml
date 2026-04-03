import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Window{
    id:window
    width:640
    height:480
    visible:true
    title:qsTr("hello world")
    color:"gray"

    Column{
        spacing:20
        anchors.centerIn:parent

        Item{
            width:200
            height:50
            Rectangle{
                id:rect
                anchors.fill:parent
                width:200
                height:50
                color:"green"
                radius:8
                MouseArea{
                    anchors.fill:parent
                    onClicked:{
                        console.log("111")
                    }
                }
            }
            MultiEffect {
                anchors.fill:rect
                source:rect
                shadowBlur: 0.8
                shadowColor: "red"
                shadowVerticalOffset: 8
                shadowEnabled:true
                blurEnabled: true   // 类似 glow
                blur: 0.5

            }
        }

        Item{
            width:200
            height:50
            Rectangle{
                id:rect2
                anchors.fill:parent
                width:200
                height:50
                // color:"green"
                radius:8

                MouseArea{
                    anchors.fill:parent
                    onClicked:{
                        console.log("222")
                    }
                }
            }
            MultiEffect{
                anchors.fill:rect2
                source:rect2
                shadowEnabled:true
                shadowBlur: 0.8
                shadowColor: "blue"
                shadowVerticalOffset: 8

                blurEnabled: true   // 类似 glow
                blur: 0.5
            }

        }

    }






}