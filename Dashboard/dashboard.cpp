#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QQmlContext>
#include <iostream>
#include "radialbar.h"
#include "ets2telemetry.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qputenv("QML_XHR_ALLOW_FILE_READ", "1");

    short work_screens_num = 2;
    bool is_fullscreen = false;

    QList<QScreen*> screens = QGuiApplication::screens();
    //std::cout << "screens.length() = " << screens.length();
    //QString current_qml = QStringLiteral("qrc:/dashboard.qml");
    qmlRegisterType<ets2telemetry>("Telemetry", 1, 0, "Ets2Telemetry");

    ets2telemetry telemetry;
    telemetry.fetchData();

    QQmlApplicationEngine engine2;
    const QUrl url_2(QStringLiteral("qrc:/dashboard.qml"));
    QObject::connect(&engine2, &QQmlApplicationEngine::objectCreated,
        &app, [url_2](QObject *obj, const QUrl &objUrl) {
            if (!obj && url_2 == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine2.load(url_2);

    /*

    QQmlApplicationEngine engine1;
    qmlRegisterType<RadialBar>("CustomControls", 1, 0, "RadialBar");
    const QUrl url(QStringLiteral("qrc:/dashboard.qml"));
    QObject::connect(&engine1, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine1.load(url);
    if (work_screens_num >= 1 && is_fullscreen) {
        engine1.rootContext()->setContextProperty("screenWidth", screens[0]->size().width());
        engine1.rootContext()->setContextProperty("screenHeight", screens[0]->size().height());
        engine1.rootObjects().first()->setProperty("x", screens[0]->geometry().x());
        engine1.rootObjects().first()->setProperty("y", screens[0]->geometry().y());
        engine1.rootObjects().first()->setProperty("width", screens[0]->size().width());
        engine1.rootObjects().first()->setProperty("height", screens[0]->size().height());
    }
    if (work_screens_num >= 2) {

        if (!is_fullscreen) {
            engine2.rootContext()->setContextProperty("screenWidth", screens[1]->size().width());
            engine2.rootContext()->setContextProperty("screenHeight", screens[1]->size().height());
            engine2.rootObjects().first()->setProperty("x", screens[1]->geometry().x());
            engine2.rootObjects().first()->setProperty("y", screens[1]->geometry().y());
            engine2.rootObjects().first()->setProperty("width", screens[1]->size().width());
            engine2.rootObjects().first()->setProperty("height", screens[1]->size().height());
        }
    }

*/

    return app.exec();
}
