import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    id: root
    width: 200
    height: 30
    clip: true
//    anchors.left: parent.left
//    anchors.right: parent.right
    color: "#0E1621"
    radius: 6
    property alias delegate_image: delegate_image.source
    property alias title: title.text
    property alias mArea: mArea

    Behavior on color{
        ColorAnimation{duration: 100}
    }

    Image{
        id: delegate_image
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 164
        anchors.left: parent.left
        anchors.leftMargin: 6

    }
    MV_Text{
        id: title
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
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
            cursorShape = Qt.PointingHandCursor
        }
        onExited: {
            root.color = "#0E1621"
            cursorShape = Qt.ArrowCursor
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_width:30}D{i:2;anchors_height:18;anchors_width:151;anchors_x:41;anchors_y:6}
}
##^##*/
