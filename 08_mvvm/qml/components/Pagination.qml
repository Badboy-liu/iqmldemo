import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout{
    id:root
    property int currentPage:1
    property int pageSize:10
    property int total:0
    property bool loading:false

    signal pageChanged(int page)

    function totalPages(){
        return Math.max(1,Math.ceil(total/pageSize))
    }

    Layout.alignment:Qt.AlignHCenter

    Button{
        text:"上一页"
        enabled: currentPage > 1 && !loading
        onClicked:{
            root.pageChanged(currentPage-1)
        }
    }
    Text {
        text: "第 " + currentPage + " / " + root.totalPages() + " 页"
        font.bold: true
    }

    Button {
        text: "下一页"
        enabled: currentPage < root.totalPages() && !loading
        onClicked: {
            root.pageChanged(currentPage + 1)
        }
    }
}