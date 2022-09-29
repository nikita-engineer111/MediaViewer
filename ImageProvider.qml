import QtQuick 2.14
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Item {
    id: root
    property alias source: image.source
    anchors.fill: parent
    Image{
        id: imageBackground
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: image.source
        smooth: true
        //visible: false
    }
    FastBlur{
        anchors.fill: imageBackground
        source: imageBackground
        radius: 70
    }

    property alias image: image
    Flickable {
        anchors.fill: parent

        contentWidth: Math.max(image.width * image.scale, root.width)
        contentHeight: Math.max(image.height * image.scale, root.height)
        clip: true
        Image {
            id: image
            //anchors.fill: parent
            anchors.centerIn: parent
            property real zoom: 0.0
            property real zoomStep: 0.1
            asynchronous: true
            cache: false
            smooth: true
            antialiasing: true
            mipmap: true
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            rotation: imageRotation.value
            scale: /*1//*/Math.min(root.width / width, root.height / height, 1) + zoom
            property variant arrayPhoto: []
            Behavior on scale{
                NumberAnimation{duration: 150}
            }
            Behavior on rotation{
                NumberAnimation{duration: 150}
            }

            onSourceChanged:{
                if(!menuImage.opened)
                {
                    menuImage.list_Property.updated = false
                    menuImage.list_Property.reloadList(source)

                    arrayPhoto = fileInfo.getFilesDirectoty(source)
                    menuImage.listOtherPhoto.reloadList(arrayPhoto)
                }
                zoom = 0.0
                image.source
            }

            //Shadow
            layer.enabled: true
            layer.effect: DropShadow {
                anchors.fill: image
                horizontalOffset: 0
                verticalOffset: 0
                radius: 10
                samples: 10
                color: "Black"
                source: image
            }
        }
    }
    MouseArea {
        id:mArea
        anchors.fill: parent
        onClicked: popup_MouseMenu.open()
        acceptedButtons: Qt.NoButton || Qt.RightButton
        onWheel: {
            if(!menuImage.opened)
            {
//                if (wheel.angleDelta.y > 0)
//                    image.zoom = Number((image.zoom + image.zoomStep).toFixed(1))
//                else
//                    if (image.zoom > 0) image.zoom = Number((image.zoom - image.zoomStep).toFixed(1))

                image.zoom/*scale*/ += wheel.angleDelta.y/2000
                wheel.accepted=true
            }


        }
    }
    Popup{
        id: popup_MouseMenu
        x: mArea.mouseX+10
        y: mArea.mouseY+10
        enter: Transition{
            ParallelAnimation{
                NumberAnimation{property: "width";from:0;to: 200; duration: 90}
                NumberAnimation{property: "height";from:0;to: mouseMenu.absoluteHeight; duration: 90}
            }

        }
        exit: Transition{
            ParallelAnimation{
                NumberAnimation{property: "width";from:200;to: 0; duration: 90}
                NumberAnimation{property: "height";from:mouseMenu.absoluteHeight;to: 0; duration: 90}
            }
        }

        background: ImageMouseMenu{
            id: mouseMenu
            anchors.fill: parent
        }
    }
    Popup{
        id: popup_imageRotation
        anchors.centerIn: parent
        width: imageRotation.width
        height: imageRotation.height
        enter: Transition {
            NumberAnimation{property: "scale";duration:150;from:0;to:1}
        }
        exit: Transition {
            NumberAnimation{property: "scale";duration:150;from:1;to:0}
        }
        background: ImageRotation{
            id: imageRotation

        }
    }
    Popup{
        id: popup_Image_SaveAs
        anchors.centerIn: parent
        width: image_SaveAs.width
        height: image_SaveAs.height
        onOpened: {
            image_SaveAs.save_path.hndlText=handleString.removeBegin(handleString.removeChar(image.source,fileInfo.getFileName(image.source)),8)
            image_SaveAs.save_path.text = image_SaveAs.save_path.hndlText
        }
        onClosed: {
            image_SaveAs.save_path.hndlText=handleString.removeBegin(handleString.removeChar(image.source,fileInfo.getFileName(image.source)),8)
            image_SaveAs.save_path.text = image_SaveAs.save_path.hndlText
            image_SaveAs.quality_slider.value = 100
        }

        enter: Transition {
            NumberAnimation{property: "scale";duration:150;from:0;to:1}
        }
        exit: Transition {
            NumberAnimation{property: "scale";duration:150;from:1;to:0}
        }
        background: Image_SaveAs{
            id: image_SaveAs

        }
    }

    FileDialog {
        id: fileDialog
        title: "Select image file"
        folder: shortcuts.documents
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg *.svg *.bmp)",
        ]
        onAccepted: {
            image.source = fileDialog.fileUrl

            menuImage.list_Property.updated = false
            menuImage.listOtherPhoto.updated = false
            menuImage.list_Property.reloadList(source)

            image.arrayPhoto = fileInfo.getFilesDirectoty(source)
            menuImage.listOtherPhoto.reloadList(image.arrayPhoto)
        }
    }
    MenuImage{
        id: menuImage
    }
}
