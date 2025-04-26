#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineQuick/QtWebEngineQuick>  // Include for WebEngine initialization
#include <QQmlContext>
#include "Controllers/system.h"
#include "Controllers/audiocontroller.h"
#include "Controllers/BluetoothManager.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    // Initialize QtWebEngineQuick for WebEngineView support
    QtWebEngineQuick::initialize();


    // Instantiate the System and AudioController objects
    System m_systemHandler;
    AudioController m_audioController;
    BluetoothManager bluetoothManager;
    qmlRegisterType<BluetoothManager>("BluetoothManager", 1, 0, "BluetoothManager");


    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("dashboard_1", "Main");

    // Set context properties before loading the QML file
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("audioController", &m_audioController);
    context->setContextProperty("bluetoothManager", &bluetoothManager);
    return app.exec();
}

