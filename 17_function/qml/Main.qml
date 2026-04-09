import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

Window{
    width:640
    height:480

    visible:true

    title:qsTr("hello world")

    function add(parameter){
        testLabel.testResult +=parameter
    }

    function minus(parameter){
        testLabel.testResult-=parameter
    }

    Label{
        id:testLabel
        y:50
        anchors.horizontalCenter:parent.horizontalCenter
        font.pixelSize:50
        color:"#ff0000"
        text:"result =" + testResult

        property int testResult:100
        MouseArea{
            anchors.fill:parent
            onClicked:{
                parent.testResult+=1
            }
        }
    }

    Label{
        id:label2
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.top:testLabel.bottom
        anchors.topMargin:10
        font.pixelSize:59
        color:"#00ff00"
        text:"result = "+label2Result
        property int label2Result:100

        MouseArea{
            anchors.fill:parent
            onClicked:{
                parent.label2Result+=2
            }
        }
    }


}
