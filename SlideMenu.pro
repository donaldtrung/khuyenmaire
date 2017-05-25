TEMPLATE = app

QT += qml quick widgets
QT += core sql
android: {
QT += androidextras
}
android:launchMode="singleInstance"

SOURCES += sources/main.cpp \
    sources/mydevice.cpp

HEADERS += sources/mydevice.h

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES +=

