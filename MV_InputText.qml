import QtQuick 2.0

TextInput {
    id: root
    color: "white"
    font.pixelSize: 16
    font.family: "Verdana"
    text: qsTr("Example Text")
    selectByMouse: true

    MouseArea{
        id: mArea
        anchors.fill: parent
        enabled: root.readOnly
        visible: enabled
        hoverEnabled: visible
        onEntered: cursorShape = Qt.PointingHandCursor
        onExited: cursorShape = Qt.ArrowCursor
        onClicked: {
            root.selectAll()
            root.copy()
            root.deselect()
            colorAnim.start()
        }
    }
    SequentialAnimation{
        id: colorAnim
        onStarted: console.debug("qerhqet5hqerht")
        ColorAnimation {
            target: root
            property: "color"
            from: "white"
            to: "#8542DF"
            duration: 100
        }
        ColorAnimation {
            target: root
            property: "color"
            from: "#8542DF"
            to: "white"
            duration: 100
        }
        ColorAnimation {
            target: root
            property: "color"
            from: "white"
            to: "#8542DF"
            duration: 100
        }
        ColorAnimation {
            target: root
            property: "color"
            from: "#8542DF"
            to: "white"
            duration: 100
        }
    }
}
