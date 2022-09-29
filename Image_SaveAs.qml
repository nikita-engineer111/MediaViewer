import QtQuick 2.0
import QtQuick.Controls 2.12
//import QtQuick.Dialogs 1.2
import Qt.labs.platform 1.1

Rectangle {
    id: root
    width: 450
    height: 170
    color: "#0E1621"
    radius: 20
    property alias button_save: button_save
    property alias save_path: save_path
    property alias quality_slider: quality_slider

    MV_Text {
        id: mV_Text
        x: 20
        y: 8
        color: "#848899"
        text: "Выберете путь, название и формат файла:"
        font.pixelSize: 14
    }

    MV_Text {
        id: save_path
        x: 20
        y: 31
        width: 281
        height: 18
        elide: Text.ElideRight
        property string hndlText: handleString.removeBegin(handleString.removeChar(image.source,fileInfo.getFileName(image.source)),8)
        text: hndlText
    }

    MV_Button {
        id: button_path
        x: 307
        y: 27
        title: "Выбрать.."
        mArea.onClicked: fileDialog_Save.open()
    }

    FileDialog {
        id: fileDialog_Save
        title: "Select directory"
        nameFilters: [
            "Image file (*.jpg)",
            "Image file (*.png)",
            "Image file (*.svg)",
            "Image file (*.bmp)",
        ]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            console.debug(save_path.text)
            save_path.text = handleString.removeBegin(fileDialog_Save.file,8)
        }
    }

    MV_Text {
        id: mV_Text2
        x: 20
        y: 77
        color: "#848899"
        text: "Выберете качество файла:"
        font.pixelSize: 14
    }

    MV_Button {
        id: button_file_resolution
        x: 307
        y: 72
        title: quality_slider.value+"%"
    }

    MV_Slider{
        id: quality_slider
        x: 20
        y: 117
        width: 385
        height: 4
        value: 100
    }

    MV_Button {
        id: button_save
        x: 140
        y: 136
        anchors.horizontalCenter: parent.horizontalCenter
        title: "Сохранить"
        mArea.onClicked: {
            if(save_path.text !== save_path.hndlText)
            {
                fileInfo.saveAsFile(handleString.removeBegin(image.source,8),save_path.text,quality_slider.value,image.rotation)
                popup_Image_SaveAs.close()

                menuImage.list_Property.updated = false
                menuImage.listOtherPhoto.updated = false

                image.arrayPhoto = fileInfo.getFilesDirectoty(source)
                menuImage.listOtherPhoto.reloadList(image.arrayPhoto)
            }
            else{
                button_path.errorEmptyInfo()
            }

        }
    }

}
