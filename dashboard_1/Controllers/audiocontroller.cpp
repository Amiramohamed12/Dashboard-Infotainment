#include "audiocontroller.h"

AudioController::AudioController(QObject *parent)
    : QObject{parent}
    , m_volumeLevel ( 49 )
{

}

void AudioController::incrementVolume(const int &val)
{
    int newVolume = m_volumeLevel + val;

    if ( newVolume <= 0)
        newVolume = 0;

    if ( newVolume >= 100)
        newVolume = 100;

    setVolumeLevel ( newVolume );
}

void AudioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel != newVolumeLevel) {
        m_volumeLevel = newVolumeLevel;
        emit volumeLevelChanged(); // Emit signal when volume changes
    }
}

int AudioController::volumeLevel() const
{
    return m_volumeLevel;
}
