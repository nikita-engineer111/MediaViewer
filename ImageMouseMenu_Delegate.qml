import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    id: root
    width: 170
    height: 30
    color: "#0E1621"
    radius: 6
    property alias image: delegate_image.source
    property alias title: title.text
    property alias mArea: mArea

    Behavior on color{
        ColorAnimation{duration: 100}
    }

    Image{
        id: delegate_image
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter

    }
    MV_Text{
        id: title
        y: 6
        width: 121
        height: 18
        verticalAlignment: Text.AlignVCenter
        anchors.left: delegate_image.right
        anchors.leftMargin: 5
        elide: Text.ElideRight
    }
    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            root.color = "#17212B"
        }
        onExited: {
            root.color = "#0E1621"
        }
    }
}
