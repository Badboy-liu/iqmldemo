import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Drawer {
    id: root
    parent: Overlay.overlay
    width: window.width * 0.7
    height: window.height
    edge: Qt.RightEdge
    modal: true
    Overlay.modal: Rectangle {
        color: "#80000000"   // 半透明黑
    }

    // 🔧 可配置
    property string title: ""
    property bool loading: false

    // 👉 插槽（关键！！！）
    default property alias content: centerBox.data

    signal submit()
    signal cancel()

    Rectangle {
        anchors.fill: parent
        color: "#ffffff"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // 🔷 头部
            Rectangle {
                Layout.fillWidth: true
                height: 50
                color: "#f5f6fa"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 12

                    Text {
                        text: root.title
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Item { Layout.fillWidth: true }

                    // Button {
                    //     text: "✕"
                    //     onClicked: {
                    //         root.close()
                    //         root.cancel()
                    //     }
                    // }
                }
            }

            // 📄 内容区（插槽）
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Item {
                    width: 200
                    anchors.centerIn: parent

                    ColumnLayout {
                        id: centerBox   // ⭐ 插槽挂这里
                        anchors.fill: parent
                        spacing: 12
                    }
                }
            }

            // 🔻 底部
            Rectangle {
                Layout.fillWidth: true
                height: 60
                color: "#fafafa"
                border.color: "#eee"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 12

                    Item { Layout.fillWidth: true }

                    Button {
                        text: "取消"
                        background: Rectangle {
                            color: "#409eff"
                            radius: 6
                        }
                        onClicked: {
                            root.close()
                            root.cancel()
                        }
                    }

                    Button {
                        text: root.loading ? "提交中..." : "确定"
                        enabled: !root.loading

                        background: Rectangle {
                            color: "#409eff"
                            radius: 6
                        }

                        onClicked: root.submit()
                    }
                }
            }
        }
    }
}