import QtQuick 2.0
import QtMultimedia 5.8

Rectangle {
    id: root
    height: 75
    anchors.bottom: parent.bottom
    width: /*640//*/parent.width
    color: "#17212B"

    MV_Slider{
        id: slider_position
        value: (audio.position/audio.duration)*100
        onUserChangedValueChanged: {
            var seek = (value_private/100)*audio.duration
            audio.seek(seek)
        }
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
    }
    MV_Text{
        id: audio_duration
        x: 322
        text: {
            var hours = (audio.duration/1000)/60/60
            var minute = (audio.duration/1000)/60
            var secund = (minute - Math.floor(minute))*60
            if(Math.floor(hours) == 0)
            {
                var fixMin = Math.floor(minute)
                var fixSec = Math.floor(secund)
                var result_minute = fixMin.toString().length===1 ? "0"+fixMin : fixMin
                var result_secund = fixSec.toString().length===1 ? "0"+fixSec : fixSec
                return result_minute+":"+result_secund
            }
            else{
                var fixHours = Math.floor(hours)
                var fixMin2 = Math.floor(minute) - (fixHours*60)
                var fixSec2 = Math.floor(secund)
                var result_hours = fixHours.toString().length===1 ? "0"+fixHours : fixHours
                var result_minute2 = fixMin2.toString().length===1 ? "0"+fixMin2 : fixMin2
                var result_secund2 = fixSec2.toString().length===1 ? "0"+fixSec2 : fixSec2
                return result_hours+":"+result_minute2+":"+result_secund2
            }
        }
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.right: parent.right
        anchors.rightMargin: 8
    }

    MV_Text {
        id: slider_value
        x: 325
        y: 0
        text: slider_position.value+"%"
        anchors.topMargin: 46
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.right: parent.right
    }

    MV_Text {
        id: audio_position
        x: 130
        y: 1
        text: {
            var hours_position = (audio.position/1000)/60/60
            var minute_position = (audio.position/1000)/60
            var secund_position = (minute_position - Math.floor(minute_position))*60
            if(Math.floor(hours_position) === 0)
            {
                var fixMin = Math.floor(minute_position)
                var fixSec = Math.floor(secund_position)
                var result_minute = fixMin.toString().length===1 ? "0"+fixMin : fixMin
                var result_secund = fixSec.toString().length===1 ? "0"+fixSec : fixSec
                return result_minute+":"+result_secund+" / "
            }
            else{
                var fixHours = Math.floor(hours_position)
                var fixMin2 = Math.floor(minute_position) - (fixHours*60)
                var fixSec2 = Math.floor(secund_position)
                var result_hours = fixHours.toString().length===1 ? "0"+fixHours : fixHours
                var result_minute2 = fixMin2.toString().length===1 ? "0"+fixMin2 : fixMin2
                var result_secund2 = fixSec2.toString().length===1 ? "0"+fixSec2 : fixSec2
                return result_hours+":"+result_minute2+":"+result_secund2+" / "
            }

        }

        anchors.topMargin: 16
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.right: audio_duration.left
    }

    MV_InputText {
        id: audio_name
        y: 4
        text: fileInfo.getFileName(audio.source)
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.topMargin: 16
        anchors.top: parent.top
        readOnly: true
    }
    MV_Button_Image{
        id: previous_track
        x: 16
        y: 45
        width: 18
        height: 20
        source: "qrc:/source/item/next.png"
        replaceSource: "qrc:/source/item/next_purple.png"
        rotation: 180
    }

    MV_Button_Image {
        id: next_track
        y: 45
        width: 18
        height: 20
        anchors.left: previous_track.left
        anchors.leftMargin: 29
        source: "qrc:/source/item/next.png"
        replaceSource: "qrc:/source/item/next_purple.png"
    }

    MV_Button_Image {
        id: repeat_track
        y: 40
        anchors.left: next_track.right
        anchors.leftMargin: 11
        source: "qrc:/source/item/repeater.png"
        replaceSource: "qrc:/source/item/repeater.png"
        mArea.onClicked: {
            if(audio.loops !== Audio.Infinite)
            {
                audio.loops = Audio.Infinite
                source = "qrc:/source/item/repeater_purple.png"
                defaultSource = "qrc:/source/item/repeater_purple.png"
                replaceSource = "qrc:/source/item/repeater_purple.png"
            }
            else{
                audio.loops = 0
                source = "qrc:/source/item/repeater.png"
                defaultSource = "qrc:/source/item/repeater.png"
                replaceSource = "qrc:/source/item/repeater.png"
            }
        }
    }
    property alias sound_Volume: sound_Volume.value
    Button_Sound_Volume{
        id: sound_Volume
        y: 45
        anchors.left: repeat_track.right
        anchors.leftMargin: 11

    }
}

/*##^##
Designer {
    D{i:2;anchors_y:12}D{i:3;anchors_y:12}D{i:4;anchors_y:12}D{i:5;anchors_x:131;anchors_y:12}
}
##^##*/
