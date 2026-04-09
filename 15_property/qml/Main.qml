import QtQuick.Controls
import QtQuick.Layouts
import QtQuick


Window{
    id:window
    width:640
    height:480
    title:qsTr("hello world")
    visible:true
    // default
    readonly property int varInt:10
     property real f:1.0
    property bool bool1:true
    property string str:""
    property alias varIntAlias:window.title
    property date d:new Date()
    property rect r:Qt.rect(1,2,3,4)
    property size sizes:Qt.size(50,50)
    property point pp:Qt.point(50,50)
    property color cs:Qt.color("#ddd")
    property url urls:"https://baidu.com"
    property var obj:({ name: "1", age: 1 })
    property list<Button> buttons
    property string t:Qt.formatTime(new Date(),"HH:mm:ss")


    Component.onCompleted:{
        console.log("time:"+t)
        console.log("varInt:"+varInt)
        console.log("varIntAlias:"+varIntAlias)
        console.log("boolean:"+bool1)
        console.log("f:"+f)
        console.log("date:"+d)
        console.log("rect:"+r)
        console.log("size:"+sizes)
        console.log("point:"+pp)
        console.log("color:"+cs)
        console.log("urls:"+urls)
        console.log("obj:"+obj)
        console.log("obj:"+buttons)
    }
}
