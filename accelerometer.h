#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

#include <QObject>
#include <QtSensors/QAccelerometer>
#include <QtSensors/QAccelerometerReading>

QTM_USE_NAMESPACE

class Accelerometer : public QObject
{
    Q_OBJECT
public:
    explicit Accelerometer(QObject *parent = 0);

signals:
    void newReading();

public slots:
    void start();
    void stop();

    qreal getX();
    qreal getY();
    qreal getZ();

private slots:
    void readingChanged();

private:
    QAccelerometer *accelerometer;

};

#endif // ACCELEROMETER_H
