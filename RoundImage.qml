import QtQuick 2.14
import QtGraphicalEffects 1.12
Rectangle {
    id: background
    width: 300
    height: 300
    radius: 10
    antialiasing: true
    property alias source: photoImage.source
    Image {
        id: photoImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop//fillMode: Image.PreserveAspectFit
        asynchronous: true
        smooth: true
        visible: false
        antialiasing: true
        mipmap: true
    }
    OpacityMask {
        id: roundedPhoto
        anchors.fill: background
        source: photoImage
        maskSource: background
        visible: (photoImage.status==Image.Ready)
        antialiasing: true
    }
}
