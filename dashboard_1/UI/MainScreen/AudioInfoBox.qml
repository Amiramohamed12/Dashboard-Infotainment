import QtQuick 2.15
import QtMultimedia 6.7

Rectangle {
    id: root
    width: 350
    height: 150

    // Properties to set title, author, image, and audio
    required property int songIndex
    property alias title: titleText.text
    property alias authorName: authorText.text
    property alias imageSource: albumImage.source
    property alias audioSource: audioPlayer.source

    // Set visibility based on the current song index
    visible: playerController.currentSongIndex === root.songIndex


        Image {
            id: albumImage
            anchors{
            top: parent.top
            left: parent.left
            leftMargin: 10
            }
            width: 100
            height: 100
            source: imageSource
        }

            Text {
                id: titleText
                anchors{
                top: parent.top
                topMargin: 50
                left: albumImage.right
                leftMargin: 10
                }
                text: "Title"
                color: "black"
                font.bold: true
                font.pixelSize: 16
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }

            Text {
                id: authorText
                anchors{
                left: albumImage.right
                leftMargin: 10
                top: titleText.bottom
                topMargin: 10
                }
                text: "Author"
                color: "black"
                font.pixelSize: 14
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }



    MediaPlayer {
        id: audioPlayer
        autoPlay: false

        onPlaybackStateChanged: {
            if (playbackState === MediaPlayer.Ended) {
                console.log("Playback ended for: " + audioPlayer.source);
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            audioPlayer.play();
        } else {
            audioPlayer.stop();
        }
    }
}

