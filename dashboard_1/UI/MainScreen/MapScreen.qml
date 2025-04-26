import QtQuick 2.15
import QtWebEngine

Rectangle {
    id: mapScreen
    Component.onCompleted: {
        obdScreen.visible = false
    }
    radius: 15
    anchors {
        left: leftBar.right
        top: statusBar.bottom
        bottom: parent.bottom
        topMargin: 10
        leftMargin: multimediaWidget.visible? 30 : 10
        bottomMargin: multimediaWidget.visible? 20 : 10
    }
    width: multimediaWidget.visible? 650 : 1240

        WebEngineView {
            id: mapView
            anchors.fill: parent
            url: "https://www.google.com/maps"
        }
    }

