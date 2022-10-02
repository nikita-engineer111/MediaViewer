import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 200
    height: 200
    anchors.centerIn: parent
    property Gradient borderGradient: borderGradient
    property int borderWidth: 3
    property bool running: fasle

    Loader {
        id: loader
        width: 200
        height: 200
        anchors.centerIn: parent
        active: borderGradient
        sourceComponent: border
    }

    Gradient {
        id: borderGradient
        GradientStop {
            id: gradientStop1
            position: 0.000
            color: "#FF0003"//red Qt.rgba(1, 0, 0, 1)
        }
        GradientStop {
            id: gradientStop2
            position: 0.167
            color: "#C0FF00"//yellow Qt.rgba(1, 1, 0, 1)
        }
        GradientStop {
            id: gradientStop3
            position: 0.333
            color: "#00FF0B"//green Qt.rgba(0, 1, 0, 1)
        }
        GradientStop {
            id: gradientStop4
            position: 0.500
            color: "#00FFE0"//lightblue Qt.rgba(0, 1, 1, 1)
        }
        GradientStop {
            id: gradientStop5
            position: 0.667
            color: "#0004FF"//blue Qt.rgba(0, 0, 1, 1)
        }
        GradientStop {
            id: gradientStop6
            position: 0.833
            color: "#FF00DF"//violet Qt.rgba(1, 0, 1, 1)
        }
        GradientStop {
            id: gradientStop7
            position: 1.000
            color: "#FF0003"//red Qt.rgba(1, 0, 0, 1)
        }
    }

    function restartAnim()
    {
        anim.restart()
    }
    function stopAnim()
    {
        anim.start()
    }

    Component {
        id: border
        Item {
            id: borderItem
            antialiasing: true
            ConicalGradient {
                id: borderFill
                anchors.fill: parent
                gradient: borderGradient
                visible: false
            }

            Rectangle {
                id: mask
                radius: 360
                border.width: root.borderWidth
                anchors.fill: parent
                color: 'transparent'
                visible: false
                antialiasing: true
            }

            OpacityMask {
                id: opM
                anchors.fill: parent
                source: borderFill
                maskSource: mask
                antialiasing: true
            }
            //Shadow
            layer.enabled: true
            layer.effect: DropShadow {
                id: shadow
                anchors.fill: borderItem
                horizontalOffset: 0
                verticalOffset: 0
                radius: 10
                samples: 10
                color: "#00FFE0"
                source: borderItem
                antialiasing: true
                SequentialAnimation{
                    id: anim
                    running: root.running
                    property var colorArray: ["#FF0003","#C0FF00","#00FF0B","#00FFE0","#0004FF","#FF00DF"]
                    onStopped: {
                        if(root.running){
                            var rand = Math.floor(Math.random() * 40)+20
                            numAnim1.to = rand
                            numAnim2.from = rand
                            numAnim1.duration = 250
                            numAnim2.duration = 250
                            colorAnim.from = colorArray[Math.floor(Math.random() * 5)+1]
                            colorAnim.to = colorArray[Math.floor(Math.random() * 5)+1]
                        }
                        else{
                            numAnim1.to = 15
                            numAnim1.duration = 500
                            numAnim2.from = 15
                            numAnim2.duration = 500
                            colorAnim.to = "#00FFE0"
                        }

                        restart()
                    }
                    ParallelAnimation{
                        SequentialAnimation{
                            NumberAnimation {
                                id: numAnim1
                                target: shadow
                                properties: "radius, samples"
                                duration: 250
                                easing.type: Easing.InOutQuad
                                from: 10
                                to: 20
                            }
                            NumberAnimation {
                                id: numAnim2
                                target: shadow
                                properties: "radius, samples"
                                duration: 250
                                easing.type: Easing.InOutQuad
                                from: 20
                                to:10
                            }
                        }

                        ColorAnimation {
                            id: colorAnim
                            target: shadow
                            property: "color"
                            from: "#00FFE0"
                            to: "#FF0003"
                            duration: 250
                        }
                    }
                }
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
