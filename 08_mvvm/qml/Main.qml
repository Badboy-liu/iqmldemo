import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import App 1.0   // 👈 必须加

ApplicationWindow{
    width:500
    height:700
    visible:true
    property int currentPage: 1
    property bool loading: false
    property int pageSize: 10

    Component.onCompleted:{
        loadData()
    }
    // 🚀 统一加载函数（关键！）
    function loadData() {
        loading = true

        req.pageNo = currentPage
        req.pageSize = pageSize
        req.keyword = searchInput.text

        userVm.load(req)

        // ⚠️ 如果你C++没有回调，这里临时模拟
        Qt.callLater(() => loading = false)
    }

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
                    loadData()
                }
            }
        }
        Rectangle{
            Layout.fillWidth:true
            Layout.fillHeight:true
            radius:10
            color:"#f8f9fb"
            border.color:"#e5e7eb"
            StackLayout {
                anchors.fill:parent
                currentIndex:loading?1:(userVm.model.count===0?2:0)
                ListView{
                    id: listView   // 👈 加这个
                    anchors.fill: parent
                    model:userVm.model
                    spacing:10
                    delegate:Rectangle{
                        // width:parent.width
                        width: listView.width   // ✅ 正确
                        // width:parent.width
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

                }

                Column{
                    Layout.alignment: Qt.AlignCenter
                    spacing:10
                    BusyIndicator{
                        running:true
                    }

                    Text{
                        text:"加载中..."
                        color:"#888"
                    }
                }

                Column{
                    Layout.alignment: Qt.AlignCenter
                    spacing:10

                    Text{
                        text:"暂无数据"
                        color:"#999"
                    }
                }
            }
        }
        RowLayout{
            Button{
                text:"上一页"
                enabled:currentPage>1 && !userVm.loading
                onClicked:{
                    currentPage--     // ✅ 必须更新

                    loadData()
                }
            }

            Text {
                text: "第 " + currentPage + " 页 / 共 " +
                    Math.ceil(userVm.total / pageSize) + " 页"
                font.bold: true
            }
            Button{
                enabled:currentPage<Math.ceil(userVm.total/pageSize) && !userVm.loading
                text:"下一页"
                onClicked:{
                    currentPage++     // ✅ 必须更新

                    loadData()
                }
            }
        }

    }
}
