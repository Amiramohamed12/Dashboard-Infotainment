import QtQuick 6.7
import QtQuick.Controls 6.7
import BluetoothManager 1.0


Rectangle {
    id: bluetoothScreen
    visible: false
    width: 1170
    height: 700
    color: "Black"
    anchors {
        top: statusBar.bottom
        left: leftBar.right
    }

BluetoothManager {
id: bluetoothManager

}

    Column {
        spacing: 20
        anchors.fill: parent
        anchors.margins: 20

        Rectangle {
            width: parent.width
            height: 20
            color: "transparent"
        }

        Row {
            width: parent.width
            spacing: 10

            Text {
                id: bluetoothText
                text: "Bluetooth"
                font.pixelSize: 28
                font.bold: true
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
            }

            Switch {
                id: bluetoothSwitch
                checked: false
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onCheckedChanged: bluetoothManager.powerOn()
            }
        }

        Rectangle {
            width: 1
            height: 10
            color: "transparent"
        }

        Rectangle {
            width: parent.width
            visible: bluetoothSwitch.checked
            height: 60
            color: "#1E1E1E"
            radius: 5
            border.color: "#2C2C2C"
            border.width: 1

            Row {
                anchors.fill: parent
                visible: bluetoothSwitch.checked
                anchors.margins: 10
                spacing: 15

                Column {
                    Text {
                        text: "Device name"
                        font.pixelSize: 18
                        color: "gray"
                    }
                    Text {
                        text: bluetoothManager.deviceName
                        font.pixelSize: 20
                        color: "white"
                        font.bold: true
                    }
                }
            }
        }

        Text {
            text: "Paired devices"
            visible: bluetoothSwitch.checked
            font.pixelSize: 16
            color: "gray"
        }

        Flickable {
            id: flickableArea
            visible: bluetoothSwitch.checked
            width: parent.width
            height: parent.height - 200
            contentHeight: deviceList.height
            clip: true

            ListView {
                id: deviceList
                width: parent.width
                height: contentHeight


                delegate: Rectangle {
                    width: deviceList.width
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
                            source: "qrc:/icons/bluetooth.png"
                            width: 24
                            height: 24
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: modelData
                            font.pixelSize: 18
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                id: vScrollBar
                policy: ScrollBar.AlwaysOn
            }
        }
    }
}
