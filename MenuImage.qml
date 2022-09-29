import QtQuick 2.0
import QtQuick.Controls 2.12

Item{
    id: root
    height: opened ? 200 : 20
    anchors.bottom: parent.bottom
    width: /*640//*/parent.width
    property bool opened: false
    Behavior on height{
        NumberAnimation{duration: 100}
    }
    property bool updated: list_Property.updated

    Rectangle {
        id:backgrond
        color: "#17212B"//core.global_color.selectBackground
        opacity: 0.85
        anchors.fill: parent
        anchors.topMargin: 20
        Image{
            id: rectButton
            anchors.horizontalCenter: parent.horizontalCenter
            width: 30
            height: 30
            source: "qrc:/source/item/arrow.png"
            y: -30
            Behavior on rotation{
                NumberAnimation{duration: 100}
            }

            SequentialAnimation{
                id: buttonAnim
                loops: Animation.Infinite
                running: opened === false
                NumberAnimation {
                    target: rectButton
                    property: "y"
                    duration: 500
                    from: -30
                    to:-40
                }
                NumberAnimation {
                    target: rectButton
                    property: "y"
                    duration: 500
                    from: -40
                    to:-30
                }
            }

            MouseArea{
                //id: mArea
                anchors.fill: parent
                hoverEnabled: true
                onEntered: cursorShape = Qt.PointingHandCursor
                onExited: cursorShape = Qt.ArrowCursor
                property variant arrayPhoto: []
                onClicked: {
                    if(opened)
                    {
                        opened = false
                        rectButton.rotation = 0
                    }
                    else{
                        opened = true
                        rectButton.rotation = 180
                        if(!list_Property.updated)
                        {
                            list_Property.reloadList(image.source)
                            console.debug(fileInfo.getFilesDirectoty(image.source))
                            arrayPhoto = fileInfo.getFilesDirectoty(image.source)
                            listOtherPhoto.reloadList(arrayPhoto)

                        }


                    }
                }
            }
        }


    }

    MV_Text{
        text: "Другие фото в этой папке:"
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: backgrond.top
        anchors.topMargin: 6
    }

    MV_Text {
        id: textProperty
        x: 329
        y: 26
        text: "Свойства:"
        anchors.rightMargin: 226
        anchors.right: parent.right
        anchors.top: backgrond.top
        anchors.topMargin: 6
    }
    property alias list_Property: list_Property
    List_Property{
        id: list_Property
        x: 329
        width: 291
        clip: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 20
    }

    Line {
        x: 242
        y: 20
        width: 2
        height: backgrond.height
        anchors.rightMargin: 7
        anchors.right: textProperty.left
        anchors.verticalCenter: backgrond.verticalCenter
        anchors.verticalCenterOffset: 0
    }
    property alias listOtherPhoto: listOtherPhoto
    List_ImageCard{
        id: listOtherPhoto
        anchors.right: textProperty.left
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 50
    }

}


