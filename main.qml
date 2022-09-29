import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: core
    visible: true
    width: 640
    height: 480
    title: qsTr("Photo Viewer")
    color: global_color.backgrond

    Component.onCompleted: {
        core.showMaximized()
        rootImage.source="file:///"+images
    }
    TextInput {
        id: name
        text: rootImage.source
        selectByMouse: true
        font.pixelSize: 30
        anchors.centerIn: parent
    }

    MouseArea{
        id: mArea
        anchors.fill: parent
        hoverEnabled: true
    }
    property alias global_color: global_color
    Item{
        id: global_color
        property string backgrond: "#0E1621"
        property string selectBackground: "#17212B"
        property string doubleSelectBackground: "#202B36"
        property string violet: "#8542DF"
    }
    ImageProvider{
        id: rootImage
    }




}
