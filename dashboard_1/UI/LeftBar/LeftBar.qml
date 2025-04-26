import QtQuick 2.15

Rectangle {
    id: leftBar
    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }
    width: 140
    color: "grey"


    Image {
        id: mapApp
        source: "qrc:/UI/Assets/icons/map.png"
        width: 100
        height: width
        anchors{
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
       fillMode: Image.PreserveAspectFit
       MouseArea {
               id: mapMouseArea
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

    Component.onCompleted: {
        appScreen1.visible = false
        mapScreen.visible = true
        home.visible = false
        appsIcon.visible = true

    }
    Image {
        id: musicApp
        source: "qrc:/UI/Assets/icons/music.png"
        width: 100
        height: width
        anchors {
            top: mapApp.bottom
            topMargin: 10  // Adjust margin as needed
            horizontalCenter: parent.horizontalCenter
        }
        fillMode: Image.PreserveAspectFit

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
        id: phoneIcon
        source: "qrc:/UI/Assets/icons/Phone.png"
        width: 100
        height: width
        anchors {
            top: musicApp.bottom
            topMargin: 10  // Adjust margin as needed
            horizontalCenter: parent.horizontalCenter
        }
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // Handle click event here
            }
        }
    }

    Image {
        id: appsIcon
        source: "qrc:/UI/Assets/icons/apps.png"
        width: 100
        height: width
        anchors{
            bottom: parent.bottom
            bottomMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
       fillMode: Image.PreserveAspectFit
       MouseArea {
           anchors.fill: parent
           onClicked: {
               appScreen1.visible = true
               mapScreen.visible = false
               multimediaWidget.visible = false
               youtubeScreen.visible = false
               obdScreen.visible = false
               bluetoothScreen.visible = false
               wifiScreen.visible = false
            }
        }
    }

    Image {
        id: home
        source: "qrc:/UI/Assets/icons/home.png"
        width: 50
        height: width
        anchors{
            bottom: parent.bottom
            bottomMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
        fillMode: Image.PreserveAspectFit
        MouseArea {
            anchors.fill: parent
            onClicked: {
                appScreen1.visible = false
                mapScreen.visible = true
                multimediaWidget.visible = true
                youtubeScreen.visible = false
                obdScreen.visible = false
            }
        }
    }

    Connections {
        target: appScreen1
        onVisibleChanged: {
            if (appScreen1.visible) {
                home.visible = true;
                appsIcon.visible = false;
            } else {
                home.visible = false;
                appsIcon.visible = true;
            }
        }
    }
    VolumeController {
        id: volumeControl
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }


}
