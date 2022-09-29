import QtQuick 2.14
import QtQuick.Controls 2.12

ScrollView {
    id: root
    width: 228
    height: 147
    property bool updated: false
    clip: true
    ListView{
        id: listView
        visible: menuImage.opened
        anchors.fill: parent
        anchors.margins: 5
        spacing: 20
        model: ListModel{id: listModel}
        orientation: Qt.Horizontal
        //ScrollBar.vertical.policy: ScrollBar.AlwaysOff
        delegate: Image_Card{
            id: image_Card
            title: title_temp
            source: source_temp
            anchors.verticalCenter: parent.verticalCenter
            mArea.onClicked: {
                image.source = source
                menuImage.list_Property.updated = false
                menuImage.list_Property.reloadList(source)
            }
        }
    }
    function reloadList(list)
    {
        listModel.clear()
        for(var i=0;i<list.length;i++)
        {
            listModel.append({title_temp:list[i][0],
                             source_temp:"file:///"+list[i][1]})
        }
        console.debug(list)
        updated = true
    }
}
