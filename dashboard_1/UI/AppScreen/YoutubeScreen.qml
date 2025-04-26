import QtQuick 2.15
import QtWebEngine

Rectangle {
id: youtubeScreen
anchors.fill: appScreen1
anchors.margins: 10
WebEngineView {
    id: youtubeView
    anchors.fill: parent
    url: "https://www.youtube.com"
}
visible: false
}
