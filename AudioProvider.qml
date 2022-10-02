import QtQuick 2.0
import QtMultimedia 5.8

Item {
    id: root
    anchors.fill: parent
    property alias audio: audio
    Audio{// *.mp3 *.mpc *.wav *.wma *.m4a *.m4b *.m4p
        id: audio
        autoPlay: buttonPlay.playing
        //source: "file:///C:/Users/CEO/Downloads/16.mp3"
        onStopped: buttonPlay.playing = false
    }
    AudioAnimation{
        id: audioAnimation
        running: buttonPlay.playing
        ButtonPlay{
            id: buttonPlay
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            scale: 2.2
            playing: true
            onPlayingChanged: {
                if(playing){
                    audio.play()
                    audioAnimation.restartAnim()

                }
                else{
                    audio.pause()
                    audioAnimation.stopAnim()

                }
            }
        }
        MouseArea{
            id: mAreaAnim
            anchors.fill: parent
            hoverEnabled: true
            onEntered: buttonPlay.enter()
            onExited: buttonPlay.exit()
            onClicked: buttonPlay.click()
        }
    }
    AudioMenu{

    }
}
