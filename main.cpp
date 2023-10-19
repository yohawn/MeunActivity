#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>
#include <string>
#include <QDebug>
#include <QString>
#include <json/json.hpp>
#include <json/json_fwd.hpp>
#include "listactivity.h"
#include "lalistbaseactivity.h"
#include "lalistbaseactivity.h"
#include "lalistdetailactivity.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //���ػ󵵽����ϸ���Ȱ��ȭ�ϴ� Qt ���ø����̼� �Ӽ��� �����մϴ�. �̴� ���ػ� ȭ�鿡�� ���ø����̼��� �� �� ���̵��� �����ݴϴ�.

    //Ŭ�������ν��Ͻ��������մϴ�.�̰��� Qt Quick ���ø����̼��� �����ϱ� ���� Qt GUI ���ø����̼� ��ü�Դϴ�
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ListActivity listActivity;
    engine.rootContext()->setContextProperty("ListActivity_Qml", &listActivity);

    LalistDetailActivity lalistFrontActivity;//Front
    lalistFrontActivity.setScreen(nScreen::eFront);
    engine.rootContext()->setContextProperty("LalistFrontActivity_Qml", &lalistFrontActivity);

    LalistDetailActivity lalistRearLeftActivity; //RearLeftr
    lalistRearLeftActivity.setScreen(nScreen::eRearLeft);
    engine.rootContext()->setContextProperty("LalistRearLeftActivity_Qml", &lalistRearLeftActivity);


    LalistDetailActivity lalistRearRightActivity; //RearLeftr
    lalistRearRightActivity.setScreen(nScreen::eRearRight);
    engine.rootContext()->setContextProperty("LalistRearRightActivity_Qml", &lalistRearRightActivity);

    const QUrl url(QStringLiteral("qrc:/ListActivityView.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,

                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

}









