import QtQuick 2.0

Item {
    id: root
    width: 200
    height: 20
    property alias value: slider_volume.value_private
    MV_Button_Image{
        id: sound_button
        width: 20
        height: 20
        source: "qrc:/source/item/sound.png"
        replaceSource: "qrc:/source/item/sound_purple.png"
        property bool sounding: true
        mArea.onClicked: {
            if(sounding)
            {
                sounding=false
                source = "qrc:/source/item/no_sound_purple.png"
                defaultSource = "qrc:/source/item/no_sound.png"
                replaceSource = "qrc:/source/item/no_sound_purple.png"
                slider_volume.lastValue = slider_volume.value_private
                slider_volume.value = 0
            }
            else{
                sounding=true
                source = "qrc:/source/item/sound_purple.png"
                defaultSource = "qrc:/source/item/sound.png"
                replaceSource = "qrc:/source/item/sound_purple.png"
                slider_volume.value = slider_volume.lastValue
            }
        }
    }

    MV_Text {
        id: sound_volume
        y: 2
        text: slider_volume.value_private+"%"
        anchors.left: sound_button.right
        anchors.leftMargin: 6
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }

    MV_Slider {
        id: slider_volume
        y: 8
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: sound_volume.right
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter
        color: "#0E1621"
        property int lastValue:100
        value: 100
        onValue_privateChanged: {
            if(value_private!==0)
            {
                lastValue = value_private
                sound_button.source = "qrc:/source/item/sound.png"
                sound_button.defaultSource = "qrc:/source/item/sound.png"
                sound_button.replaceSource = "qrc:/source/item/sound_purple.png"
            }
        }

    }
}

/*##^##
Designer {
    D{i:2;anchors_x:26}D{i:3;anchors_x:69}
}
##^##*/
