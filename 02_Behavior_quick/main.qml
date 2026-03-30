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
    }
}