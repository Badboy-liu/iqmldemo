import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

Window{
    id:window
    width:640
    height:480

    visible:true

    title:qsTr("hello world")




        enum Type {
            Apple,
            Banana
        }

    Component.onCompleted: {
        console.log(Object.keys(window))
        console.log("Apple: " + window.Apple)
        console.log("Apple(直接): " + Apple)
    }

}
