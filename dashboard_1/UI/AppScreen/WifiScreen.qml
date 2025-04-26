import QtQuick 6.7
import QtQuick.Controls 6.7

Rectangle {
    id: wifiScreen
    visible: false
    width: 1170
    height: 700
    color: "Black"
    anchors {
        top: statusBar.bottom
        left: leftBar.right
    }


    Column {
        spacing: 20
        anchors.fill: parent
        anchors.margins: 20

        // Wi-Fi Header and Switch
        Row {
            width: parent.width
            spacing: 10

            Text {
                id: wifiText
                text: "WiFi"
                font.pixelSize: 28
                font.bold: true
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
            }

            Switch {
                id: wifiSwitch
                checked: true
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // Spacer
        Rectangle {
            width: 1
            height: 10
            color: "transparent"
        }

        // Saved Networks Section
        Text {
            text: "Saved networks"
            visible: wifiSwitch.checked
            font.pixelSize: 16
            color: "gray"
        }

        Rectangle {
            width: parent.width
            visible: wifiSwitch.checked
            height: 60
            color: "#1E1E1E"
            radius: 5
            border.color: "#2C2C2C"
            border.width: 1

            Row {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 15

                Image {
                    source: "qrc:/icons/wifi_connected.png"
                    width: 24
                    height: 24
                    anchors.verticalCenter: parent.verticalCenter
                }

                Column {
                    Text {
                        text: "Mohamed"
                        font.pixelSize: 18
                        color: "white"
                    }
                    Text {
                        text: "Connected"
                        font.pixelSize: 14
                        color: "lightgray"
                    }
                }
            }
        }

        // Available Networks Section
        Text {
            text: "Available networks"
            visible: wifiSwitch.checked
            font.pixelSize: 16
            color: "gray"
        }

        // ListView with ScrollBar
        Flickable {
            id: flickableArea
            visible: wifiSwitch.checked
            width: parent.width
            height: parent.height - 250
            contentHeight: wifiList.height
            clip: true

            ListView {
                id: wifiList
                width: parent.width
                height: contentHeight

                model: ListModel {
                    ListElement { ssid: "AndroidShare_7949"; locked: true }
                    ListElement { ssid: "Z.H"; locked: true }
                    ListElement { ssid: "Mam"; locked: true; is5GHz: true }
                    ListElement { ssid: "Manar"; locked: true }
                    ListElement { ssid: "Ayoub_EXT"; locked: true }
                    ListElement { ssid: "Orange-MAZEN"; locked: true }
                    ListElement { ssid: "medo"; locked: true }
                }

                delegate: Rectangle {
                    width: wifiList.width
                    height: 60
                    color: "#1E1E1E"
                    radius: 5
                    border.color: "#2C2C2C"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 15



                        Text {
                            text: model.ssid + (model.is5GHz ? " 5GHz" : "")
                            font.pixelSize: 18
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }

            // ScrollBar attached to the Flickable
            ScrollBar.vertical: ScrollBar {
                id: vScrollBar
                policy: ScrollBar.AlwaysOn
            }
        }

        // Add Network Button
        Text {
            text: "Add network"
            visible: wifiSwitch.checked
            color: "#0094FF"
            font.pixelSize: 16
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
