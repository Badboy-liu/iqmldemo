import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id:root
    property string mode:"add"
    property int userId:-1
    // ⭐ 改这里（关键！！）
    property alias name: nameInput.text
    property alias age: ageInput.text

    signal submit(string name,int age)

    ColumnLayout{
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter   // ✅ 用这个代替 centerIn

        Text{
            text:mode==="add"?"新增用户":"编辑用户"
            font.bold:true
        }
        TextField{
            id:nameInput
            text:root.name
            placeholderText:"用户名"
            Layout.fillWidth: true
        }
        TextField{
            Layout.fillWidth: true
            id:ageInput
            text:root.age>0?root.age:""
            placeholderText:"年龄"
            inputMethodHints:Qt.ImhDigitsOnly
        }
        // RowLayout{
        //     Layout.fillWidth: true
        //     Layout.alignment:Qt.AlignRight
        //     Button{
        //         text:"提交"
        //         onClicked:{
        //             if (nameInput.text==='' || ageInput.text==='')return
        //             root.submit(nameInput.text,parseInt(ageInput.text))
        //         }
        //     }
        // }
    }
}