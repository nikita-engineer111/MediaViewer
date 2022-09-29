import QtQuick 2.0

Item {
    id: root
    width: 222
    height: 20
    property alias title: title.text
    property alias value: value.text
    Rectangle{
        id: backgroundDelegate
        anchors.fill: parent
        color: "#17212B"//core.global_color.selectBackground
        opacity: 0
        radius: 20

    }
    MV_Text{
        id: title
        color: "lightgray"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 4
        font.pixelSize: 10
    }
    MV_InputText{
        id: value
        clip: true
        verticalAlignment: Text.AlignVCenter
        anchors.right: parent.right
        anchors.rightMargin: 6
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: title.right
        anchors.leftMargin: 8
        font.pixelSize: 12
        readOnly: true
    }
}
