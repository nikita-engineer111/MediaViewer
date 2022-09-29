import QtQuick 2.0

Rectangle {
    id: root
    width: 110
    height: 120
    color: "#202B36"
    border.color: core.global_color.violet
    border.width: 0
    radius: 10
    Behavior on border.width{
        NumberAnimation{duration: 100}
    }
    Behavior on scale{
        NumberAnimation{duration: 100}
    }
    property alias source: photo_card.source
    property alias title: title.text
    property alias mArea: mArea
    RoundImage{
        id: photo_card
        width: 90
        height: 90
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MV_Text{
        id: title
        elide: Text.ElideRight
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        font.pixelSize: 14
        color: "white"
        Behavior on color{
            ColorAnimation{duration: 100}
        }
    }
    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            root.scale=1.04
            root.border.width = 2
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
            root.scale=1
            root.border.width = 0
        }

    }
}
