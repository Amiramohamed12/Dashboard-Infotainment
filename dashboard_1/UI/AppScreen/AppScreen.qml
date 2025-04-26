import QtQuick 2.15
import QtWebEngine

Rectangle {
    id: appScreen1
    width: 1260
    height: 770
    anchors {
        top: statusBar.bottom
        left: leftBar.right
    }
    color: "transparent"

    Image {
        id: phoneApp
        source: "qrc:/UI/Assets/icons/Phone.png"
        width: 140
        height: width
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 100
            leftMargin: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = false

            }
        }
    }


    Image {
        id: mapApp
        source: "qrc:/UI/Assets/icons/map.png"
        width: 140
        height: width
        anchors {
            left: phoneApp.left
            top: parent.top
            topMargin: 100
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = true
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }


    Image {
        id: musicApp
        source: "qrc:/UI/Assets/icons/music.png"
        width: 140
        height: width
        anchors {
            left: mapApp.left
            top: parent.top
            topMargin: 100
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = true
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }

    Image {
        id: settingsApp
        source: "qrc:/UI/Assets/icons/settings.png"
        width: 140
        height: width
        anchors {
            left: musicApp.left
            top: parent.top
            topMargin: 100
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }

    Image {
        id: youTubeApp
        source: "qrc:/UI/Assets/icons/youtube.png"
        width: 140
        height: width
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 390
            leftMargin: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = true
                obdScreen.visible = false
            } }

        }

    Image {
        id: oBDApp
        source: "qrc:/UI/Assets/icons/OBD.png"
        width: 140
        height: width
        anchors {
            left: youTubeApp.left
            top: parent.top
            topMargin: 390
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = true
            }
        }
    }

    Image {
        id: bluetoothApp
        source: "qrc:/UI/Assets/icons/bluetooth.png"
        width: 140
        height: width
        anchors {
            left: oBDApp.left
            top: parent.top
            topMargin: 390
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }

    Image {
        id: wifiApp
        source: "qrc:/UI/Assets/icons/wifi.png"
        width: 140
        height: width
        anchors {
            left: bluetoothApp.left
            top: parent.top
            topMargin: 390
            leftMargin: 280
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = false
                multimediaWidget.visible = false
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }

    Text {
        id: phoneText
        text: "Phone"
        anchors {
            top: phoneApp.bottom
            topMargin: 15
            horizontalCenter: phoneApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: mapText
        text: "Map"
        anchors {
            top: mapApp.bottom
            topMargin: 15
            horizontalCenter: mapApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: musicText
        text: "Music"
        anchors {
            top: musicApp.bottom
            topMargin: 15
            horizontalCenter: musicApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: settingsText
        text: "Settings"
        anchors {
            top: settingsApp.bottom
            topMargin: 15
            horizontalCenter: settingsApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: youTubeText
        text: "YouTube"
        anchors {
            top: youTubeApp.bottom
            topMargin: 15
            horizontalCenter: youTubeApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: oBDText
        text: "OBD"
        anchors {
            top: oBDApp.bottom
            topMargin: 15
            horizontalCenter: oBDApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: bluetoothText
        text: "Bluetooth"
        anchors {
            top: bluetoothApp.bottom
            topMargin: 15
            horizontalCenter: bluetoothApp.horizontalCenter
        }
        color: "white"
    }

    Text {
        id: wifiText
        text: "WiFi"
        anchors {
            top: wifiApp.bottom
            topMargin: 15
            horizontalCenter: wifiApp.horizontalCenter
        }
        color: "white"
    }
}
