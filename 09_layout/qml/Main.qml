import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow{
    id:window
    width:500
    height:700
    visible:true

    property int currentIndex :0

    ColumnLayout{
        anchors.fill:parent
        spacing:0

        Rectangle{
            Layout.fillWidth:true
            Layout.preferredHeight:50
            color:"#2c3e50"
            Text{
                text:"后台管理系统"
                color:"white"
                font.bold:true
            }
            Item{
                Layout.fillWidth:true
            }
            Text{
                text:"mateo"
                color:"white"
            }
        }
        RowLayout{
            Layout.fillWidth:true
            Layout.fillHeight:true
            Rectangle{
                Layout.preferredWidth:160
                Layout.fillHeight:true
                color:"#34495e"
                ColumnLayout{
                    anchors.fill:parent
                    spacing:6

                    Repeater{
                        model:["用户管理","系统设置","关于"]
                        Button{
                            text:modelData
                            Layout.fillWidth:true
                            background:Rectangle{
                                radius:6
                                color:index===currentIndex?"#409eff":"transparent"
                            }
                            onClicked:currentIndex = index
                        }
                    }
                }
            }
            Rectangle{
                Layout.fillWidth:true
                Layout.fillHeight:true
                color:"#ecf0f1"

                StackLayout{
                    anchors.fill:parent
                    currentIndex:window.currentIndex
                    Rectangle{
                        color:"#ecf0f1"
                        Text{
                            anchors.centerIn:parent
                            text:"用户管理页面"
                        }
                    }
                    Rectangle{
                        color:"#ecf0f1"
                        Text{
                            anchors.centerIn:parent
                            text:"系统设置页面"
                        }
                    }
                    Rectangle{
                        color:"#ecf0f1"
                        Text{
                            anchors.centerIn:parent
                            text:"关于页面"
                        }
                    }
                }
            }
        }
        Rectangle{
            Layout.fillWidth:true
            Layout.preferredHeight:20
            color:"blue"
        }
    }
}

