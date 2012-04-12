#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

#include <QObject>
#include <QtSensors/QAccelerometer>
#include <QtSensors/QAccelerometerReading>

#define MIN_TRESHOLD 4
#define MIN_G_TRESHOLD 9.5
#define MAX_G_TRESHOLD 10.5

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
    void parseReading();
    bool checkMinTreshold(qreal value);
    bool isGTreshold(qreal value);
    int phase1_checkMinTreshold();
    int phase1_checkG(bool checkMinTreshold);
    bool check22G(qreal value);
    int phase1_check22G();

    QAccelerometer *accelerometer;

};

#endif // ACCELEROMETER_H
