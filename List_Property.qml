import QtQuick 2.0
import QtQuick.Controls 2.12

ScrollView{
    id: root
    width: 291
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
    property bool updated: false
    ListView{
        id: listView
        anchors.fill: parent
        anchors.margins: 4
        spacing: 2
        model: ListModel{id: listModel}
        delegate: List_Property_Delegate{
            id: list_Property_Delegate
            title: title_temp
            value: value_temp
        }
    }
    function reloadList(source)
    {
        listModel.clear()

        listModel.append({title_temp: "Имя:",value_temp: fileInfo.getFileName(source)})
        listModel.append({title_temp: "Путь:",value_temp:fileInfo.getFilePath(source)})
        listModel.append({title_temp: "Размер:",value_temp:fileInfo.getFileSize(source)+" "+"МБ"})
        listModel.append({title_temp: "Разрешение:",value_temp:""})
        listModel.append({title_temp: "Дата создания:",value_temp:fileInfo.getFileDateCreated(source)})
        listModel.append({title_temp: "Дата изменения:",value_temp:"DateTime"})

        updated = true
    }
}
