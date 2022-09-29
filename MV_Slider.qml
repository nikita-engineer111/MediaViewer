import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id: root
    width: 200
    height: 4
    radius: root.height
    color: "#17212B"
    border.width: 0
    property int value: 0

    onValueChanged: {
        //circle.x = (value*root.width)/100
    }

    Rectangle{
        height: root.height
        radius: root.height
        color: "#8542DF"
        anchors.left: parent.left
        anchors.right: circle.left
        anchors.rightMargin: -5
        border.width: 0

    }
    MouseArea{
        anchors.fill: parent
        anchors.topMargin: -8
        anchors.bottomMargin: -8
        onClicked: circle.x = mouseX
    }
    Rectangle{
        id: circle
        width: 20
        height: 20
        radius: 20
        x: (value*root.width)/100
        antialiasing: true
        anchors.verticalCenter: parent.verticalCenter
        color: "#202B36"
        border.color: "#8542DF"
        onXChanged: {
            value = (circle.x/root.width)*100
        }

        Behavior on scale{
            NumberAnimation{duration: 100}
        }
        Behavior on x{
            NumberAnimation{duration: 100}
        }

        MouseArea{
            id: mArea
            anchors.fill: parent
            hoverEnabled: true
            drag.maximumX: root.width
            drag.minimumX: 0//-10
            drag.target:circle
            drag.axis: Drag.XAxis
            onEntered: {
                cursorShape = Qt.PointingHandCursor
                circle.scale = 1.1
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
                circle.scale = 1
            }
        }
    }

}
