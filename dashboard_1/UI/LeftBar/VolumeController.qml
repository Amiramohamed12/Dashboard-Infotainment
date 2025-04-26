import QtQuick 2.15

Item {
    property int defaultVolumeLevel: 20
    property bool isMuted: false
    Connections {
        target: audioController
        function onVolumeLevelChanged() {
            visibleTimer.stop()
            volumeLevel.visible = false
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 1500
        repeat: false
        onTriggered: {
            volumeLevel.visible = true
        }
    }

    Rectangle {
        id: incrementButton
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter  // Changed to avoid dependency on volumeLevel
        }
        width: 50
        height: 30
        color: "transparent"
        rotation: -90

        Text {
            id: incrementText
            color: "white"
            anchors.centerIn: parent
            text: qsTr(">")
            font.pixelSize: 30
        }
        MouseArea {
            anchors.fill: parent
            onClicked: audioController.incrementVolume(1)
        }
    }

    Image {
        id: volumeLevel
        source: {
            if (audioController.volumeLevel < 1)
                return "qrc:/UI/Assets/icons/mute.png"
            else if (audioController.volumeLevel < 50)
                return "qrc:/UI/Assets/icons/low_volume.png"
            else
                return "qrc:/UI/Assets/icons/high_volume.png"
        }
        width: 50
        height: width
        anchors {
            top: incrementButton.bottom
            topMargin: 15
            horizontalCenter: parent.horizontalCenter
        }
        fillMode: Image.PreserveAspectFit
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (audioController.volumeLevel > 0) {
                    audioController.volumeLevel = 0;
                } else {
                    audioController.volumeLevel = defaultVolumeLevel;
                }
            }
        }
    }

    Text {
        id: volumeTextLevel
        visible: !volumeLevel.visible
        anchors.centerIn: volumeLevel
        color: "white"
        font.pixelSize: 24
        text: audioController.volumeLevel
    }

    Rectangle {
        id: decrementButton
        anchors {
            top: volumeLevel.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        width: 50
        height: 30
        color: "transparent"
        rotation: -90

        Text {
            id: decrementText
            color: "white"
            anchors.centerIn: parent
            text: qsTr("<")
            font.pixelSize: 30
        }
        MouseArea {
            anchors.fill: parent
            onClicked: audioController.incrementVolume(-1)
        }
    }
}
