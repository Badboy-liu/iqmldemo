import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import App 1.0   // 👈 必须加

ApplicationWindow{
    width:500
    height:700
    visible:true
    property int currentPage: 1

    UserPageReq {
        id: req
    }

    ColumnLayout{
        anchors.fill:parent
        spacing:10
        // padding:10
        anchors.margins: 10   // ✅ 正确

        RowLayout{
            TextField{
                id :searchInput
                placeholderText:qsTr("搜索用户名")
                Layout.fillWidth:true
            }
            Button {
                text: "搜索"
                onClicked: {
                    req.pageNo = currentPage
                    req.pageSize = 10
                    req.keyword = searchInput.text

                    userVm.load(req)
                }
            }
        }

        ListView{
            Layout.fillWidth:true
            Layout.fillHeight:true
            model:userVm.model
            spacing:10
            delegate:Rectangle{
                width:parent.width
                height:80
                radius:10
                color:"#ffffff"
                border.color:"#ddd"

                RowLayout{
                    anchors.fill:parent
                    anchors.margins:10
                    ColumnLayout{
                        Layout.fillWidth:true
                        Text{
                            text:name
                            font.bold:true
                            font.pixelSize:14
                        }
                        Text{
                            text:"年龄:"+age
                            color:"#666"
                        }
                    }
                    Button{
                        text:"删除"
                        onClicked:{

                        }
                    }
                }
            }
            RowLayout{
                Button{
                    text:"上一页"
                    onClicked:{
                        req.pageNo = currentPage-1
                        req.pageSize = 10
                        req.keyword = searchInput.text

                        userVm.load(req)
                    }
                }
                Text{
                    text:"条数"
                }
                Button{
                    text:"下一页"
                    onClicked:{
                        req.pageNo = currentPage+1
                        req.pageSize = 10
                        req.keyword = searchInput.text

                        userVm.load(req)
                    }
                }
            }
        }
    }
}
