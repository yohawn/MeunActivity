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
    //고해상도스케일링을활성화하는 Qt 애플리케이션 속성을 설정합니다. 이는 고해상도 화면에서 애플리케이션이 더 잘 보이도록 도와줍니다.

    //클래스의인스턴스를생성합니다.이것은 Qt Quick 애플리케이션을 시작하기 위한 Qt GUI 애플리케이션 객체입니다
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









