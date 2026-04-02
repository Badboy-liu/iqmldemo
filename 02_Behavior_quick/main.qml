import QtQuick
import QtQuick.Controls

Window{
    id:window
    width: 640
    height: 480
    visible: true

    ParallelAnimation{
        id:pAni
        PropertyAnimation{
            id:ani1
            target:btn
            property:"width"
            to:400
            duration:1000
            onStopped:{
                ani2.restart()
            }
        }
        PropertyAnimation{
            id:ani2
            target:btn
            property:"height"
            from:100
            duration:1000
        }
    }

    SequentialAnimation{
        id:sAni
        PropertyAnimation{
            id:ani3
            target:btn2
            property:"width"
            to:400
            duration:1000
            onStopped:{
                ani2.restart();
            }
        }
        PropertyAnimation{
            id:ani4
            target:btn2
            property:"height"
            from:100
            to:100
            duration:1000
        }
    }

    Column{
        spacing: 20 // 两个矩形之间的间距
        anchors.centerIn: parent // 让整个列在窗口居中
        Rectangle{
            id:btn
            width:100
            height:40
            color:"red"


            MouseArea{
                anchors.fill:parent
                onClicked:{
                    pAni.start();
                }
            }
        }

        Rectangle{
            id:btn2
            width:100
            height:40
            color:"blue"


            MouseArea{
                anchors.fill:parent
                onClicked:{
                    sAni.start();
                }
            }
        }
    }

}