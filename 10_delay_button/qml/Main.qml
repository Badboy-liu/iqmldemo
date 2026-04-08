import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow{
    width:640
    height:480
    visible:true

    title:"hello world"

    DelayButton{
        delay:2000
        onActivated:{
            console.log("time out...")
        }

        onProgressChanged:{
            console.log("progress:"+progress)
        }
    }
}
