import QtQuick 2.15
import QtQuick.Controls 6.0

Rectangle {
    id: statusBar
    height: 30
    color: "transparent"
    anchors {
        right: parent.right
        left: leftBar.right
        top: parent.top
    }

    Image {
        id: lockIcon
        anchors{
        top: parent.top
        left: parent.left
        topMargin: 5
        leftMargin: 30
        }
        width: 20
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLock ? "qrc:/UI/Assets/icons/lock.png"
                                       : "qrc:/UI/Assets/icons/unlock.png" )
        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemHandler.carLock = !systemHandler.carLock
            }
        }
    }

    Text {
        id: outdoorTemp
        font.pixelSize: 20
        font.bold: true
        color: "white"
        text: systemHandler.outdoorTemp + "°C"
        anchors {
            verticalCenter: parent.verticalCenter
            left: lockIcon.right
            leftMargin: 20
        }
    }

    Text {
        id: dateTimeDisplay
        font.pixelSize: 20
        font.bold: true
        color: "white"
        text: systemHandler.currentTime
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }


    Image {
        id: user
        width: statusBar.height * 0.6
        height: width
        fillMode: Image.PreserveAspectFit
        source: "qrc:/UI/Assets/icons/user.png"
        anchors {
            right: userName.left
            verticalCenter: parent.verticalCenter
            rightMargin: 10
        }
    }

    Text {
        id: userName
        font.pixelSize: 20
        font.bold: true
        color: "white"
        text: systemHandler.userName
        anchors{
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 20
        }
    }


    }



