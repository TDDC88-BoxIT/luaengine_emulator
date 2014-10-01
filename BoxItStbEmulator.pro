#-------------------------------------------------
#
# Project created by QtCreator 2014-09-27T17:51:50
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = BoxItStbEmulator
TEMPLATE = app


SOURCES += main.cpp\
        emulatorwindow.cpp \
    stbemulator.cpp

HEADERS  += emulatorwindow.h \
    stbemulator.h

FORMS    += emulatorwindow.ui

OTHER_FILES += \
    script.lua

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/lua/ -llua52
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/lua/ -llua52d
else:unix: LIBS += -L$$PWD/lua/ -llua

INCLUDEPATH += $$PWD/lua
DEPENDPATH += $$PWD/lua
