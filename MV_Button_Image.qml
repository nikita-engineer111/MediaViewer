import QtQuick 2.0

Image {
    id: root
    width: 30
    height: 30
    property string defaultSource
    property string replaceSource
    property alias mArea: mArea
    Component.onCompleted: defaultSource = source
    Behavior on scale{
        NumberAnimation{duration: 100}
    }

    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            root.source = replaceSource
            root.scale = 1.07
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
            root.source = defaultSource
            root.scale = 1
        }
    }
}
