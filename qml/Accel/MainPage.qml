import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    orientationLock: PageOrientation.LockLandscape

    Item {
        anchors.centerIn: parent
        width: 311 // 4*2 + 3 (middle indicator) and 300 for value bar
        height: 38

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: 0.5

            Rectangle {
                id: axisX
                color: "black"
                height: 10

                anchors { left: parent.left; right: parent.right; top: parent.top
                    leftMargin: 4; rightMargin: 4; topMargin: 2; }
                Rectangle {
                    id: axisXValueRight
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) + 2
                    width: 20
                }
                Rectangle {
                    id: axisXValueLeft
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) - 11
                    width: 10
                }

                Rectangle {
                    // Middle of the rectangle
                    color: "white"
                    height: parent.height
                    x: (parent.width / 2) - 1
                    width: 3
                }
            }

            Rectangle {
                id: axisY
                color: "black"
                height: 10

                anchors { left: parent.left; right: parent.right; top: axisX.bottom
                    leftMargin: 4; rightMargin: 4; topMargin: 2; }
                Rectangle {
                    id: axisYValueRight
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) + 2
                    width: 20
                }
                Rectangle {
                    id: axisYValueLeft
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) - 11
                    width: 10
                }
                Rectangle {
                    // Middle of the rectangle
                    color: "white"
                    height: parent.height
                    x: (parent.width / 2) - 1
                    width: 3
                }
            }

            Rectangle {
                id: axisZ
                color: "black"
                height: 10

                anchors { left: parent.left; right: parent.right; top: axisY.bottom
                    leftMargin: 4; rightMargin: 4; topMargin: 2; }
                Rectangle {
                    id: axisZValueRight
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) + 2
                    width: 20
                }
                Rectangle {
                    id: axisZValueLeft
                    color: "lightgreen"
                    height: parent.height
                    x: (parent.width / 2) - 11
                    width: 10
                }
                Rectangle {
                    // Middle of the rectangle
                    color: "white"
                    height: parent.height
                    x: (parent.width / 2) - 1
                    width: 3
                }
            }

        }
    }

    function setAxisXValue(value) {
        if (value > 0) {
            axisXValueRight.width = value * 7;
            axisXValueLeft.x = (axisZ.width / 2) - 2;
            axisXValueLeft.width = 0;
        }
        else if (value == 0) {
            axisXValueRight.width = 0;
            axisXValueLeft.x = (axisX.width / 2) - 2;
            axisXValueLeft.width = 0;
        }
        else {
            var tempValue = value * 7;
            axisXValueRight.width = 0;
            axisXValueLeft.x = (axisX.width / 2) - 2 + tempValue;
            axisXValueLeft.width = Math.abs(tempValue) + 1;
        }
    }

    function setAxisYValue(value) {
        if (value > 0) {
            axisYValueRight.width = value * 7;
            axisYValueLeft.x = (axisY.width / 2) - 2;
            axisYValueLeft.width = 0;
        }
        else if (value == 0) {
            axisYValueRight.width = 0;
            axisYValueLeft.x = (axisY.width / 2) - 2;
            axisYValueLeft.width = 0;
        }
        else {
            var tempValue = value * 7;
            axisYValueRight.width = 0;
            axisYValueLeft.x = (axisY.width / 2) - 2 + tempValue;
            axisYValueLeft.width = Math.abs(tempValue) + 1;
        }
    }

    function setAxisZValue(value) {
        if (value > 0) {
            axisZValueRight.width = value * 7;
            axisZValueLeft.x = (axisZ.width / 2) - 2;
            axisZValueLeft.width = 0;
        }
        else if (value == 0) {
            axisZValueRight.width = 0;
            axisZValueLeft.x = (axisZ.width / 2) - 2;
            axisZValueLeft.width = 0;
        }
        else {
            var tempValue = value * 7;
            axisZValueRight.width = 0;
            axisZValueLeft.x = (axisZ.width / 2) - 2 + tempValue;
            axisZValueLeft.width = Math.abs(tempValue) + 1;
        }
    }

    Connections {
        target: Accelerometer
        onNewReading: {
            setAxisXValue(Accelerometer.getX());
            setAxisYValue(Accelerometer.getY());
            setAxisZValue(Accelerometer.getZ());
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: setAxisZValue(0);
    }
}
