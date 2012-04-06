#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include "accelerometer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    Accelerometer accelerometer;
    accelerometer.start();

    QDeclarativeContext *context = viewer.rootContext();
    context->setContextProperty("Accelerometer", &accelerometer);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/Accel/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
