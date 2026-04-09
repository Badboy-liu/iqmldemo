import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

Window{
    width:640
    height:480

    visible:true

    title:qsTr("hello world")

    ListView{
        id:listView
        width:240
        height:320
        model:9
        delegate:Rectangle{
            width:240
            height:30
            color:ListView.isCurrentItem?"red":"blue"
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    listView.currentIndex = index
                }
            }
        }
    }

    ListView{
        width:240
        height:320
        x:400
        y:20
        model:ListModel{
            id:listModel
            Component.onCompleted:{
                for (var i=0;i<10;i++){
                    listModel.append({"Name":"Item"+i})
                }
            }
        }

        delegate:Text{
            text:{index+" "+Name}
        }
    }
}
