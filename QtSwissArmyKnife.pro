#-------------------------------------------------
#
# Project created by QtCreator 2018-07-06T22:57:33
#
#-------------------------------------------------

QT += core gui xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets network

TARGET = QtSwissArmyKnife

TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, unTabPage the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    Src/Base/SAKDialog.cc \
    Src/Base/SAKMessageBox.cc \
    Src/Base/SAKWidget.cc \
    Src/main.cc \
    Src/SAKGlobal.cc \
    Src/SAKVersion.cc \
    Src/SAKMainWindow.cc \
    Src/SAKApplication.cc \
    Src/MoreInformation.cc \
    Src/Console/SAKConsole.cc \
    Src/Console/SAKLogOutput.cc \      
    Src/Common/TabPage/SAKTabPage.cc \
    Src/Common/TabPage/Highlighter/SAKHighlighter.cc \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseItem.cc \
    Src/Common/TabPage/ReadWriteSetting/SAKReadWriteSetting.cc \
    Src/Common/TabPage/Highlighter/SAKHighlighterSettingPanel.cc \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseSettingPanel.cc


HEADERS += \
    Src/Base/SAKDialog.hh \
    Src/Base/SAKMessageBox.hh \
    Src/Base/SAKWidget.hh \
    Src/SAKGlobal.hh \
    Src/SAKVersion.hh \
    Src/SAKMainWindow.hh \
    Src/SAKApplication.hh \
    Src/MoreInformation.hh \
    Src/Console/SAKConsole.hh \
    Src/Console/SAKLogOutput.hh \            
    Src/Common/TabPage/SAKTabPage.hh \
    Src/Common/TabPage/Highlighter/SAKHighlighter.hh \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseItem.hh \
    Src/Common/TabPage/ReadWriteSetting/SAKReadWriteSetting.hh \
    Src/Common/TabPage/Highlighter/SAKHighlighterSettingPanel.hh \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseSettingPanel.hh \


FORMS += \    
    Src/SAKVersion.ui \
    Src/SAKMainWindow.ui \
    Src/MoreInformation.ui \
    Src/Console/SAKConsole.ui \
    Src/Common/TabPage/SAKTabPage.ui \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseItem.ui \
    Src/Common/TabPage/ReadWriteSetting/SAKReadWriteSetting.ui \
    Src/Common/TabPage/Highlighter/SAKHighlighterSettingPanel.ui \
    Src/Common/TabPage/AutoResponse/SAKAutoResponseSettingPanel.ui


INCLUDEPATH += \
    Src \
    Src/Base \
    Src/Console \
    Src/Common/TabPage \
    Src/Common/TabPage/Highlighter \
    Src/Common/TabPage/AutoResponse \
    Src/Common/TabPage/ReadWriteSetting


RESOURCES += \
    SAKResources.qrc

#--------------------------------------------------------------------------------------------
#编译目录配置
UI_DIR      = $$OUT_PWD/ui
MOC_DIR     = $$OUT_PWD/moc
RCC_DIR     = $$OUT_PWD/res
OBJECTS_DIR = $$OUT_PWD/obj


#--------------------------------------------------------------------------------------------
# 子项目
include(SAKModulesManager.pri)

# 取消该宏的定义可以将串口模块屏蔽
winrt || linux-rasp-pi3-g++{
    DEFINES += SAK_NO_SERIALPORT_ASSISTANT
}

!contains(DEFINES, SAK_NO_SERIALPORT_ASSISTANT){
    QT  += serialport
    SOURCES += \
        Src/SerialportAssistant/SAKSerialportAssistant.cc \
        Src/SerialportAssistant/SAKSerialportAssistantControler.cc \
        Src/SerialportAssistant/SAKTabPageSerialportAssistant.cc
    HEADERS += \
        Src/SerialportAssistant/SAKSerialportAssistant.hh \
        Src/SerialportAssistant/SAKSerialportAssistantControler.hh \
        Src/SerialportAssistant/SAKTabPageSerialportAssistant.hh
    FORMS   += \
        Src/SerialportAssistant/SAKSerialportAssistantControler.ui
    INCLUDEPATH += \
        Src/SerialportAssistant
}else {
    message( "该版本Qt可能不包含串口模块，已经忽略串口模块！（串口助手功能被屏蔽！）" )
}

win32{
    RC_ICONS = window.ico
}

# 解决msvc编译器中文乱码的问题
msvc:{
    QMAKE_CXXFLAGS += -execution-charset:utf-8
}
