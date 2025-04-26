import QtQuick 2.15

Rectangle {
    id: multimediaWidget
    radius: 15
    anchors {
        left: mapScreen.right
        bottom: parent.bottom
        bottomMargin: 20
        margins: 100
    }
    width: 360
    height: 200
    color: "white"

    property bool showMultimedia: true

       PlayerController {
           id: playerController
       }

       Column {
           id: audioInfoColumn
           anchors.centerIn: parent
           spacing: 20 // Add spacing between AudioInfoBox components

           AudioInfoBox {
               id: firstSong
               songIndex: 0
               title: "Vampire"
               authorName: "Olivia Rodrigo"
               imageSource: "qrc:/UI/Assets/images/Vampire.png"
               audioSource: "qrc:/UI/Assets/audio/Vampire.mp3"
           }

           AudioInfoBox {
               id: secondSong
               songIndex: 1
               title: "Fly Me to the Moon"
               authorName: "Frank Sinatra"
               imageSource: "qrc:/UI/Assets/images/fly.jpg"
           }

           AudioInfoBox {
               id: thirdSong
               songIndex: 2
               title: "Dance Monkey"
               authorName: "Tones and I"
               imageSource: "qrc:/UI/Assets/images/dance.jpeg"
           }
       }


       Rectangle {
           id: bottomBar
           radius: 15
           anchors {
               bottom: parent.bottom
               left: parent.left
               right: parent.right
           }
           height: 50

           Image {
               id: previousButton
                z: 1
               anchors{
               left: parent.left
               verticalCenter: parent.verticalCenter
               leftMargin: 10
               }
               width: 30
               height: 30
               source: "qrc:/UI/Assets/icons/previous.png"
               MouseArea {
                      id: previousMouseArea
                      anchors.fill: parent
                      onClicked: {
                          playerController.switchToPreviousSong()
                     }
               }
               }

           Image {
                   id: playPauseButton
                   anchors{
                   left: previousButton.right
                   verticalCenter: bottomBar.verticalCenter
                   leftMargin: 75
                   }
                   width: 30
                   height: 30
                   cache: false
                   source: playerController.playing ? "qrc:/UI/Assets/icons/pause.png" : "qrc:/UI/Assets/icons/play.png"
                   MouseArea {
                          id: playPauseMouseArea
                          anchors.fill: parent
                          onClicked: {
                             playerController.playPause()
                         }
                   }  }

               Image {
                   id: nextButton
                   anchors{
                   left: playPauseButton.right
                   verticalCenter: bottomBar.verticalCenter
                   leftMargin: 75
                   }
                   width: 30
                   height: 30
                   source: "qrc:/UI/Assets/icons/next.png"
                   visible: true
                   MouseArea {
                          id: nextMouseArea
                          anchors.fill: parent
                          onClicked: {
                            playerController.switchToNextSong()
                        }
                    }
                }

    }

}
