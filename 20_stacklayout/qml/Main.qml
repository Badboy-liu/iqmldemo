import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

Window{
    id:window
    width:900
    height:600

    visible:true

    title:qsTr("hello world")


    ColumnLayout{
        anchors.fill: parent
        spacing: 8
        anchors.leftMargin:5
        RowLayout{
            Layout.fillWidth:true
            Layout.preferredHeight:100
            Text{
                text:"信息栏"
            }
        }
        RowLayout{
            Layout.fillWidth:true
            Layout.fillHeight:true
            ListView{
                id:menu
                Layout.preferredWidth:150
                Layout.fillHeight: true   // 👈 关键！


                spacing: 8
                model:["首页","设置","关于"]
                delegate:Rectangle{
                    width:parent.width
                    height:50
                    radius:10

                    color:ListView.isCurrentItem?"#cccccc":"#eeeeee"
                    Text{
                        anchors.centerIn:parent
                        text:modelData
                    }

                    MouseArea{
                        anchors.fill:parent
                        onClicked:{
                            menu.currentIndex = index
                        }
                    }
                }
            }


            StackLayout{
                Layout.fillWidth:true
                Layout.fillHeight:true

                currentIndex:menu.currentIndex
                IndexPage{

                }
                SettingPage{

                }
                AboutPage{

                }
            }
        }
        RowLayout{
            Layout.fillWidth:true
            Layout.preferredHeight:50
            Text{
                text:"状态栏"
            }
        }
    }

}
