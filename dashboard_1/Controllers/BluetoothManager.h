#ifndef BLUETOOTHMANAGER_H
#define BLUETOOTHMANAGER_H

#include <QObject>
#include <QString>
#include <QStringList>

class BluetoothManager : public QObject
{
    Q_OBJECT

public:
    explicit BluetoothManager(QObject *parent = nullptr);
    ~BluetoothManager();

   Q_INVOKABLE void powerOn();
   Q_INVOKABLE void powerOff();
   Q_INVOKABLE void scanOn();
   Q_INVOKABLE bool pairDevice(const QString &macAddress);
   Q_INVOKABLE bool connectDevice(const QString &macAddress);
   Q_INVOKABLE bool disconnectDevice(const QString &macAddress);
   Q_INVOKABLE bool removeDevice(const QString &macAddress);
   Q_INVOKABLE QStringList showPairedDevices();

private:
    QString runCommand(const QString &command);
};

#endif // BLUETOOTHMANAGER_H
