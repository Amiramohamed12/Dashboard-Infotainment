import QtQuick 2.15
import QtMultimedia 6.7

Item {
    id: playerController
    property int currentSongIndex: 0
    property var songs: [
        { title: "Vampire", author: "Olivia Rodrigo", source: "qrc:/UI/Assets/audio/Vampire.mp3" },
        { title: "Fly Me to the Moon", author: "", source: "qrc:/UI/Assets/audio/Vampire.mp3" },
        { title: "Dance Monkey", author: "Tones and I", source: "qrc:/UI/Assets/audio/Vampire.mp3" }
    ]

    property bool playing: false

    MediaPlayer {
        id: mediaPlayer
        source: songs[currentSongIndex].source  // Set the initial song source

        onPlaybackStateChanged: {
            console.log("Playback state changed to: " + playbackState);
            if (playbackState === MediaPlayer.Ended) {
                switchToNextSong();  // Automatically switch to next song when one ends
            }
        }

    }

    function switchToNextSong() {
        currentSongIndex = (currentSongIndex + 1) % songs.length;
        console.log("Now playing: " + songs[currentSongIndex].title);
        mediaPlayer.source = songs[currentSongIndex].source;  // Set the new song source
        if (playing) {
            mediaPlayer.play();  // Play the song if currently playing
        }
    }

    function switchToPreviousSong() {
        currentSongIndex = (currentSongIndex - 1 + songs.length) % songs.length;
        console.log("Now playing: " + songs[currentSongIndex].title);
        mediaPlayer.source = songs[currentSongIndex].source;  // Set the new song source
        if (playing) {
            mediaPlayer.play();  // Play the song if currently playing
        }
    }

    function playPause() {
        playing = !playing;
        if (playing) {
            console.log("Playing: " + songs[currentSongIndex].title);
            mediaPlayer.source = songs[currentSongIndex].source;  // Ensure the source is set
            mediaPlayer.play();
        } else {
            console.log("Paused");
            mediaPlayer.pause();
        }
    }
}
