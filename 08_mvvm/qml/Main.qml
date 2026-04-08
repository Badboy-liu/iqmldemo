import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import App 1.0   // 👈 必须加
import "./user"
import "./components"
ApplicationWindow{
    id: window
    width:500
    height:700
    visible:true
    property int currentPage: 1
    property bool loading: false
    property int pageSize: 10
    property var selectedUser: ({})

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
            Button {
                text: "新增"
                onClicked: {
                    // formPopup.mode = "add"
                    // formPopup.open()
                    userDrawer.mode = "add"
                    userDrawer.open()
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
                                text:"编辑"
                                onClicked:{
                                    selectedUser = { id: id, name: name, age: age }

                                    // formPopup.mode = "edit"
                                    // formPopup.editId = id
                                    // formPopup.open()

                                    userDrawer.mode = "edit"
                                    userDrawer.editId = id
                                    userDrawer.open()
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
        Pagination{
            currentPage: currentPage
            pageSize: pageSize
            total: userVm.total
            loading: userVm.loading

            onPageChanged: (page) => {
                currentPage = page
                loadData()
            }
        }

    }

    FormDrawer {
        id: userDrawer
        title: mode === "add" ? "新增用户" : "编辑用户"
        loading: userVm.loading

        property string mode: "add"
        property int editId: -1

        // 👉 插入表单
        UserForm {
            id: form

            name: userDrawer.mode === "edit" ? selectedUser.name : ""
            age: userDrawer.mode === "edit" ? selectedUser.age : ""
        }

        // 👉 提交逻辑统一
        onSubmit: {
            console.log("name="+form.name)
            console.log("age="+form.age)

            if (form.name === "" || form.age === "") {
                toast.show("请填写完整")
                return
            }
            console.log("onSubmit")

            if (mode === "add") {
                userVm.add(form.name, form.age)
                toast.show("新增成功")
            } else {
                userVm.update(editId, form.name, form.age)
                toast.show("修改成功")
            }

            userDrawer.close()
        }
    }
    // Popup {
    //     id: formPopup
    //     modal: true
    //     width: 300
    //     height: 220
    //     anchors.centerIn: parent
    //
    //     property string mode: "add"
    //     property int editId: -1

        // UserForm {
        //     anchors.fill: parent
        //     mode: formPopup.mode
        //
        //     name: formPopup.mode === "edit" ? selectedUser.name : ""
        //     age: formPopup.mode === "edit" ? selectedUser.age : 0
        //
        //     onSubmit: (name, age) => {
        //         if (formPopup.mode === "add") {
        //             userVm.add(name, age)
        //             toast.show("新增成功")
        //         } else {
        //             userVm.update(formPopup.editId, name, age)
        //             toast.show("修改成功")
        //         }
        //
        //         formPopup.close()
        //     }
        // }

    // }
    Toast {
        id: toast
    }
}
