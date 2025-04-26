import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    id: obdScreen
    visible: false
    width: 1260
    height: 770
    anchors {
        top: statusBar.bottom
        left: leftBar.right
    }
    color: "transparent"
    Rectangle {
        id: searchBar
        width: parent.width / 1.5
        anchors {
            horizontalCenter: obdScreen.horizontalCenter
        }
        height: 50
        color: "transparent"
        visible: obdScreen.visible? true : false
        TextField {
            id: searchBarText
            width: parent.width * 0.9
            height: 40
            anchors.centerIn: searchBar
            placeholderText: "Search..."
            font.pixelSize: 18
        }
    }
}

