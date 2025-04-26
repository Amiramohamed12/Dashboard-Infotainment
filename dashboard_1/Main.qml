import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import "UI/LeftBar"
import "UI/MainScreen"
import "UI/StatusBar"
import "UI/AppScreen"

Window {
    id: window
    width: 1400
    height: 800
    visible: true
    title: qsTr("Dashboard")

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Image {
        id: background
        source: "qrc:/UI/Assets/images/background.png"
        width: 1400
        height: 800
    }

    StatusBar {
        id: statusBar
    }

    LeftBar{
    id: leftBar
    }

    MapScreen{
    id: mapScreen
    }

    AppScreen {
        id: appScreen1
    }


    MultiMediaWidget{
        id: multimediaWidget
    }

    YoutubeScreen {
        id: youtubeScreen
    }


    OBDScreen {
        id: obdScreen
    }


}
