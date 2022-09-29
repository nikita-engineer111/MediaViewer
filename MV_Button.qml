import QtQuick 2.0

Rectangle {
    id: root
    color: "#17212B"
    radius: 20
    width: 120
    height: 26
    Behavior on color{
        ColorAnimation{duration: 100}
    }

    property alias title: title.text
    property alias titleColor: title.color
    property alias mArea: mArea
    MV_Text{
        id: title
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 14
        Behavior on color {
            ColorAnimation{duration: 80}
        }
    }
    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            root.color = "#202B36"
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
            root.color = "#17212B"
        }
    }

    function errorEmptyInfo()
    {
        titleColor = "#EA3940"
        timer_emptyInfo.start()
    }
    Timer{
        id: timer_emptyInfo
        interval: 150
        onTriggered: {
            titleColor = "white"
            timer_emptyInfo2.start()
        }
    }
    Timer{
        id: timer_emptyInfo2
        interval: 150
        onTriggered: {
            titleColor = "#EA3940"
            timer_emptyInfo3.start()
        }
    }
    Timer{
        id: timer_emptyInfo3
        interval: 150
        onTriggered: {
            titleColor = "white"
        }
    }
}
