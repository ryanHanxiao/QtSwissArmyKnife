﻿/*******************************************************************************
* The file is encoding with utf-8 (with BOM)
*
* I write the comment with English, it's not because that I'm good at English,
* but for "installing B".
*
* Copyright (C) 2018-2018 wuhai persionnal. All rights reserved.
*******************************************************************************/
#include "SAKApplication.hh"
#include "SAKMainWindow.hh"

#include <QDebug>
#include <QSettings>
#include <QTextCursor>
#include <QTranslator>

SAKApplication::SAKApplication(int argc, char **argv):
    QApplication(argc, argv)
{
    /// 注册表选项
    setOrganizationName(QString("Qter"));
    setOrganizationDomain(QString("IT"));
    setApplicationName(QString("QtSwissArmyKnife"));

    /// 本工程好像并没有使用QTextCursor作为信号参数，根据Qt Creator的提示要求，添加该语句
    qRegisterMetaType<QTextCursor>("QTextCursor");

//    QTranslator *qtTranslator = new QTranslator(this);
//    bool ok = qtTranslator->load(QString(":/translations/Qt_zh_CN.qm"));
//    installTranslator(qtTranslator);
//    qDebug() << QString(":/translations/Qt_zh_CN.qm") << ok;

    mpMainWindow = new SAKMainWindow;
    mpMainWindow->show();
}

SAKApplication::~SAKApplication()
{

}