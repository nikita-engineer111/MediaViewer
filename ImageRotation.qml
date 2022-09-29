import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4


Rectangle {
    id: root
    width: 250
    height: 255
    color: "#0E1621"
    radius: 20
    property int value: dial.temp
    MV_Text {
        id: mV_Text
        x: 8
        text: "Вращать изображение"
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Dial {
        id: dial
        x: 67
        width: 152
        height: 147
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        value: 0
        antialiasing: true
        property int temp: 0.0
        onValueChanged: temp = 360*value
        Behavior on value{
            NumberAnimation{duration: 150}
        }

        MV_Text{
            text: root.value+"°"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    MV_Text {
        id: button_right
        x: 12
        y: 9
        text: "Повернуть вправо на 90°"
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 193
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.pixelSize: 12
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.PointingHandCursor
                button_right.color = "#8542DF"
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
                button_right.color = "white"
            }
            onClicked: dial.value = 0.25
        }
    }

    MV_Text {
        id: button_left
        x: 9
        y: 17
        text: "Повернуть влево на 90°"
        anchors.topMargin: 213
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.PointingHandCursor
                button_left.color = "#8542DF"
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
                button_left.color = "white"
            }
            onClicked: dial.value = 0.75
        }
    }

    MV_Text {
        id: button_180
        x: 4
        y: 16
        text: "Повернуть на 180°"
        anchors.topMargin: 233
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.PointingHandCursor
                button_180.color = "#8542DF"
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
                button_180.color = "white"
            }
            onClicked: dial.value = 0.5
        }
    }

}
