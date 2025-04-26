cmake_minimum_required(VERSION 3.16)

project(dashboard_1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required Qt6 components including WebEngineQuick and Multimedia
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick WebEngineQuick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appdashboard_1
    main.cpp

)

qt_add_qml_module(appdashboard_1
    URI dashboard_1
    VERSION 1.0
    QML_FILES
        Main.qml
        UI/LeftBar/LeftBar.qml
        UI/MainScreen/MapScreen.qml
        UI/MainScreen/AudioInfoBox.qml
        UI/MainScreen/MultiMediaWidget.qml
        UI/StatusBar/StatusBar.qml
        UI/AppScreen/AppScreen.qml
        UI/MainScreen/PlayerController.qml
    SOURCES
        Controllers/system.h
        Controllers/system.cpp
        QML_FILES UI/LeftBar/VolumeController.qml
        SOURCES Controllers/audiocontroller.h Controllers/audiocontroller.cpp
        QML_FILES UI/AppScreen/YoutubeScreen.qml
        QML_FILES UI/AppScreen/OBDScreen.qml
        RESOURCES UI/Assets/icons/bluetooth.png
        QML_FILES
        QML_FILES
        RESOURCES UI/Assets/icons/wifi.png
        SOURCES Controllers/BluetoothManager.h Controllers/BluetoothManager.cpp


)

# Add the resource file for images and icons

qt_add_resources(appdashboard_1 "assets"
    PREFIX "/"
    FILES "UI/Assets/icons/apps.png"
    FILES "UI/Assets/icons/map.png"
    FILES "UI/Assets/icons/music.png"
    FILES "UI/Assets/icons/Phone.png"
    FILES "UI/Assets/icons/home.png"
    FILES "UI/Assets/icons/lock.png"
    FILES "UI/Assets/icons/unlock.png"
    FILES "UI/Assets/icons/OBD.png"
    FILES "UI/Assets/icons/settings.png"
    FILES "UI/Assets/icons/mute.png"
    FILES "UI/Assets/icons/user.png"
    FILES "UI/Assets/icons/low_volume.png"
    FILES "UI/Assets/icons/high_volume.png"
    FILES "UI/Assets/icons/youtube.png"
    FILES "UI/Assets/icons/play.png"
    FILES "UI/Assets/icons/previous.png"
    FILES "UI/Assets/icons/next.png"
    FILES "UI/Assets/icons/pause.png"
    FILES "UI/Assets/images/background.png"
    FILES "UI/Assets/images/dance.jpeg"
    FILES "UI/Assets/images/Vampire.png"
    FILES "UI/Assets/images/fly.jpg"
    FILES "UI/Assets/icons/bluetooth.png"
    FILES "UI/Assets/icons/wifi.png"
    FILES "UI/Assets/audio/Vampire.mp3"


)

# Set target properties for macOS
set_target_properties(appdashboard_1 PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Link the required Qt6 modules
target_link_libraries(appdashboard_1
    PRIVATE Qt6::Quick
    PRIVATE Qt6::WebEngineQuick
    PRIVATE Qt6::Multimedia
)

# Installation setup
include(GNUInstallDirs)
install(TARGETS appdashboard_1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
