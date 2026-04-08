
import QtQuick
import QtQuick.Controls

Item{
    id:root
    anchors.fill:parent

    visible:false
    function show(msg){
        textItem.text = msg
        visible = true
        anim.restart()
    }

    Rectangle{
        anchors.horizontalCenter:parent.horizontalCenter
        y:parent.height*0.8
        color:"#333"
        opacity:0.9
        anchors.margins:10
        Text{
            id:textItem
            color:"white"
        }
    }

    SequentialAnimation{
        id:anim
        PropertyAnimation{
            target:root
            property:"opacity"
            from:0
            to:1
            duration:200
        }
        PauseAnimation{
            duration:1500
        }
        PropertyAnimation{
            target:root
            property:"opacity"
            to:0
            duration:300
        }
        onStopped:{
            root.visible = false
        }
    }
}