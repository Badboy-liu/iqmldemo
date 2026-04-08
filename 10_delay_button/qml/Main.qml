import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow{
    id:window
    width:640
    height:480
    visible:true
    color:"green"

    title:"hello world"

    ColumnLayout{
        anchors.fill:parent
        DelayButton{
            id:delayBtn
            Layout.fillWidth:true
            delay:2000
            onActivated:{
                console.log("time out...")
            }

            onProgressChanged:{
                console.log("progress:"+progress)
            }
        }

        ProgressBar {
            Layout.fillWidth:true
            width: 200
            value: delayBtn.progress   // 0~1
        }
    }

}
