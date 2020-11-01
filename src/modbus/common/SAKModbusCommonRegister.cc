﻿/*
 * Copyright 2020 Qter(qsaker@qq.com). All rights reserved.
 *
 * The file is encoded using "utf8 with bom", it is a part
 * of QtSwissArmyKnife project.
 *
 * QtSwissArmyKnife is licensed according to the terms in
 * the file LICENCE in the root of the source code directory.
 */
#include "SAKModbusCommonRegister.hh"
#include "ui_SAKModbusCommonRegister.h"

SAKModbusCommonRegister::SAKModbusCommonRegister(QWidget *parent)
    :QWidget(parent)
    ,ui(new Ui::SAKModbusCommonRegister)
{
    ui->setupUi(this);
}

SAKModbusCommonRegister::~SAKModbusCommonRegister()
{
    delete ui;
}
