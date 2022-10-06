import QtQuick 2.0

Image {
    id: root
    width: 30
    height: 30
    property string defaultSource
    property string replaceSource
    property alias mArea: mArea
    Component.onCompleted: defaultSource = source
    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            root.source = replaceSource
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
            root.source = defaultSource
        }
    }
}
