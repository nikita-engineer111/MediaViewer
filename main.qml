import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: core
    visible: true
    width: 640
    minimumWidth: 640
    height: 480
    minimumHeight: 480
    title: qsTr("Media Viewer")
    color: global_color.backgrond
    property string fileFormat
    Component.onCompleted: {
        core.showMaximized()

        name.text = files
        fileFormat = handleString.removeBegin(files,name.text.length-3)
        if(fileFormat=="jpg"||fileFormat=="png"||fileFormat=="bmp"||fileFormat=="svg")
        {
            rootImage.visible = true
            rootAudio.visible = false
            rootImage.source="file:///"+files
        }
        if(fileFormat=="mp3"||fileFormat=="mpc"||fileFormat=="wav"||fileFormat=="wma"||
           fileFormat=="m4a"||fileFormat=="m4b"||fileFormat=="m4p")
        {
            rootImage.visible = false
            rootAudio.visible = true
            rootAudio.audio.source = "file:///"+files
            rootAudio.audio.play()
        }
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
        //visible: false
    }
    AudioProvider{
        id: rootAudio
        //visible: true

    }
    TextInput {
        id: name
        text: rootImage.source
        selectByMouse: true
        font.pixelSize: 30
        anchors.centerIn: parent
        visible: false
    }



}
