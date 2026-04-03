import QtQuick
import QtQuick.Controls


Window{
    width:640
    height:480
    visible:true
    title:qsTr("hello world")

    ComboBox{
        x:20
        y:20
        model:ListModel{
            id:model
            ListElement{text:"banana"}
            ListElement{text:"apple"}
            ListElement{text:"coconut"}
        }
    }

    ComboBox{
        id:comboBox
        width:200
        height:50
        x:200
        y:20
        onCurrentIndexChanged:{
            console.log("currentIndex"+currentIndex)
        }

        onCurrentValueChanged:{
            console.log("currentValue"+currentValue)
        }

        contentItem:Text{
            id:text
            text:comboBox.displayText
            leftPadding:comboBox.indicator.width +comboBox.spacing
            topPadding:5
            bottomPadding:5
            font.pixelSize: 18
            font.bold:true
            color:comboBox.pressed?"red":"greed"
            verticalAlignment:Text.AlignVCenter
            elide:Text.ElideRight
        }

        background:Rectangle{
            implicitWidth:120
            implicitHeight:40
            color:"white"
            border.width:1
            border.color:"#21B12B"
            radius:4
        }

        indicator:Image{
            anchors.right:parent.right
            anchors.rightMargin:5
            anchors.verticalCenter:parent.verticalCenter
            width:40
            height:40
            fillMode:Image.PreserveAspectFit
            source:comboBox.down?"arrow-up.svg":"arrow-down.svg"
        }


        model:ListModel{
            id:comboModel
            ListElement{text:"banana"}
            ListElement{text:"apple"}
            ListElement{text:"coconut"}
        }

        popup:Popup{
            y:comboBox.height-comboBox.background.border.width
            width:comboBox.width
            implicitHeight:contentItem.implicitHeight
            padding:1

            contentItem:ListView{
                clip:true
                implicitHeight:contentHeight
                model:comboBox.popup.visible?comboBox.delegateModel:null
                currentIndex:comboBox.highlightedIndex
            }


            background:Rectangle{
                color:"white"
                border.width:1
                border.color:"#21B12B"
                radius:2
            }
        }
    }
}