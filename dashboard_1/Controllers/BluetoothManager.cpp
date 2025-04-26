#include "BluetoothManager.h"
#include <QProcess>
#include <QDebug>

BluetoothManager::BluetoothManager(QObject *parent) : QObject(parent)
{
}

BluetoothManager::~BluetoothManager()
{
}

QString BluetoothManager::runCommand(const QString &command) {
    char buffer[128];
    std::string result;
    std::shared_ptr<FILE> pipe(popen(command.toStdString().c_str(), "r"), pclose);
    if (!pipe) {
        qDebug() << "Error: Failed to execute command:" << command;
        return "";
    }

    while (fgets(buffer, sizeof(buffer), pipe.get()) != nullptr) {
        result += buffer;
    }

    return QString::fromStdString(result);
}

void BluetoothManager::powerOn()
{
    runCommand("bluetoothctl power on");
}

void BluetoothManager::powerOff()
{
    runCommand("bluetoothctl power off");
}

void BluetoothManager::scanOn()
{
    runCommand("bluetoothctl scan on");
}

bool BluetoothManager::pairDevice(const QString &macAddress)
{
    return runCommand("bluetoothctl pair " + macAddress).contains("successful");
}

bool BluetoothManager::connectDevice(const QString &macAddress)
{
    return runCommand("bluetoothctl connect " + macAddress).contains("Connection successful");
}

bool BluetoothManager::disconnectDevice(const QString &macAddress)
{
    return runCommand("bluetoothctl disconnect " + macAddress).contains("Successful");
}

bool BluetoothManager::removeDevice(const QString &macAddress)
{
    return runCommand("bluetoothctl remove " + macAddress).contains("Device has been removed");
}

QStringList BluetoothManager::showPairedDevices()
{
    QString output = runCommand("bluetoothctl paired-devices");
    QStringList devices;
    for (const QString &line : output.split("\n")) {
        if (line.contains("Device")) {
            devices.append(line.split(" ")[1]);
        }
    }
    return devices;
}


