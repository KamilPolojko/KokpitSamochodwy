import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import CustomControls

Window {
    width: 1920
    height: 550 //960px(bazowo)     550px(ma wyświetlacz)
    visible: true
    title: qsTr("Car DashBoard")
    color: "#1E1E1E"
    visibility: "Windowed"

    property int nextSpeed: 60
    property real fuelValue: 10
    property real speedValue: 19
    property real avgSpeedValue: 12
    property real batteryChargeValue: 12
    property real distanceValue: 56

    function readInputValues(fileName)
    {
        var file = new XMLHttpRequest();
        file.open("GET", fileName, false);
        file.send();
        var fileContent = file.responseText.trim();
        var lines = fileContent.split("\n");

        console.log(lines);
        if (fileContent.length == 5)
        {
            fuelValue = parseFloat(fileContent[0]);
            speedValue = parseFloat(fileContent[1]);
            avgSpeedValue = parseFloat(fileContent[2]);
            batteryChargeValue = parseFloat(fileContent[3]);
            distanceValue = parseFloat(fileContent[4]);

            if (isNaN(fuelValue) || isNaN(speedValue) || isNaN(avgSpeedValue) || isNaN(batteryChargeValue) || isNaN(distanceValue))
            {
                console.error("Błąd parsowania danych z pliku:", fileContent);
            }
        }
        else
        {
            console.error("Nieprawidłowy format pliku:", fileContent);
        }
    }

    Component.onCompleted:
    {
        readInputValues("input.txt");
    }

    function generateRandom(maxLimit = 70){
        let rand = Math.random() * maxLimit;
        rand = Math.floor(rand);
        return rand;
    }

    function get_speed_value_from_game(){
        let speed_value = 340 * Math.random();
        return speed_value;
    }

    Timer{
        repeat: true
        interval: 100
        running: true

        onTriggered: {
            //current_speed = get_speed_value_from_game()
        }
    }

    Timer{
        id:speedTimer
        repeat: true
        interval: 100
        running: true
        onTriggered: {
            var currDateTime = new Date()
            var curr
            var month

            curr = currDateTime.getHours() + ":" + currDateTime.getMinutes()
            time.text = curr
            month = currDateTime.getMonth() + 1
            curr = currDateTime.getDate() + "." + month + "." + currDateTime.getFullYear()
            date.text = curr
            //speedLabel.text = current_speed
        }
    }

    Shortcut {
        sequence: StandardKey.Quit
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }


    Rectangle {//Image
        id: dashboard
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "#000000"
        //source: "qrc:/assets/Dashboard.svg"

        /*
          --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Top Bar Of Screen
        */

        Image {
            id: topBar
            width: 1357
            height: 115
            // source: "qrc:/assets/Vector 70.svg"

            anchors{
                top: parent.top
                topMargin: 26.50
                horizontalCenter: parent.horizontalCenter
            }

            Label{
                id: time
                text: ""
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.DemiBold
                color: "#FFFFFF"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label{
                id: date
                text: ""
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.DemiBold
                color: "#FFFFFF"
                anchors.right: parent.right
                anchors.rightMargin: 230
                anchors.top: parent.top
                anchors.topMargin: 10
            }
        }



        /*
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Middle
        */

        // ---------------------------------

        Label{
            id:speedLabel
            text: speedValue
            font.pixelSize: 134
            font.family: "Inter"
            color: "#01E6DE"
            font.bold: Font.DemiBold
            anchors.top: parent.top
            anchors.topMargin:Math.floor(parent.height * 0.35)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label{
            text: "KM/H"
            font.pixelSize: 46
            font.family: "Inter"
            color: "#01E6DE"
            font.bold: Font.Normal
            anchors.top:speedLabel.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }


        /*
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Speed Limit Label
        */

        Rectangle{
            id:speedLimit
            width: 0
            height: 0
            radius: height/2
            color: "#D9D9D9"
            border.color: "#CD0303"
            border.width: 10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
        }

        /*
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Left Road Bottom
        */

        Image {
            id: leftRoad
            width: 127
            height: 397
            anchors{
                left: speedLimit.left
                leftMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50
            }

            source: "qrc:/assets/Vector 2.svg"
        }

        RowLayout{
            spacing: 20

            anchors{
                left: parent.left
                leftMargin: 250
                bottom: parent.bottom
                bottomMargin: 26.50 + 65
            }

            RowLayout{
                id:temp
                spacing: 3
                Label{
                    text: "32"
                    font.pixelSize: 32
                    font.family: "Inter"
                    font.bold: Font.Normal
                    font.capitalization: Font.AllUppercase
                    color: "#FFFFFF"
                }

                Label{
                    text: "°C"
                    font.pixelSize: 32
                    font.family: "Inter"
                    font.bold: Font.Normal
                    font.capitalization: Font.AllUppercase
                    opacity: 0.2
                    color: "#FFFFFF"
                }
            }

            RowLayout{
                spacing: 1
                Layout.topMargin: 10
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
            }
        }

        /*
          ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Right Road Bottom
        */

        Image {
            id: rightRoad
            width: 127
            height: 397
            anchors{
                right: speedLimit.right
                rightMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50
            }

            source: "qrc:/assets/Vector 1.svg"
        }

        /*
          -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Right Side Gears
        */

        RowLayout{
            spacing: 20
            anchors{
                right: parent.right
                rightMargin: 250
                bottom: parent.bottom
                bottomMargin: 26.50 + 40
            }

            Label{
                text: "Ready"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#32D74B"
            }

            Label{
                text: "P"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }

            Label{
                text: "R"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "N"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "D"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 1.0
                color: "#FFFFFF"
            }
        }

         /*
           -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
           Left Side Icons
        */

        Image {
            id: seventhLeftIndicator
            width: 72
            height: 62
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: sixthLeftIndicator.top
                bottomMargin: 1
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/brak_lub_niewlasciwy_poziom_akumulatora.svg"
        }

        Image {
            id: sixthLeftIndicator
            width: 72
            height: 62
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: fifthLeftIndicator.top
                bottomMargin: 1
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/zbyt_niskie_cisnienie_w_oponach.svg"
        }

        Image {
            id: fifthLeftIndicator
            width: 72
            height: 62
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: forthLeftIndicator.top
                bottomMargin: 1
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/awaria w ukladznie elektroczniynm sterowania silnika.svg"
        }

        Image {
            id: forthLeftIndicator
            width: 72
            height: 62
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: thirdLeftIndicator.top
                bottomMargin: 1
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/Wlaczonekierunkowskazy.svg"
        }

        Image {
            id: thirdLeftIndicator
            width: 52
            height: 70.2
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: secondLeftIndicator.top
                bottomMargin: 1
            }
            source: "qrc:/assets/ipz_grafiki/Wlaczone_swiatla+drogowe.svg"
        }

        Image {
            id: secondLeftIndicator
            width: 51
            height: 51
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: firstLeftIndicator.top
                bottomMargin: 1
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/Wlaczoneswiadlamijania.svg"
        }

        Image {
            id: firstLeftIndicator
            width: 51
            height: 51
            anchors {
                left: parent.left
                leftMargin: 50
                bottom: parent.bottom
                bottomMargin: 10
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/swiatlaprzeciwmgielnetylnier.svg"
        }

        /*
        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        Right Side Icons
        */

        Image {
            id: seventhRightIndicator
            width: 86.83
            height: 56.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: sixthRightIndicator.top
                bottomMargin: 10
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/zbyt_niskie_cisnienie_oleju_silnikowego.svg"
        }

        Image {
            id: sixthRightIndicator
            width: 86.83
            height: 56.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: fifthRightIndicator.top
                bottomMargin: 10
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/otwartedwrzilubklapabagaznika.svg"
        }

        Image {
            id: fifthRightIndicator
            width: 86.83
            height: 56.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: forthRightIndicator.top
                bottomMargin: 10
            }
            opacity: 1
            source: "qrc:/assets/coffee.svg"
        }

        Image {
            id: forthRightIndicator
            width: 56.83
            height: 36.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: thirdRightIndicator.top
                bottomMargin: 20
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/awaria_abs_lub_wylczenie_ukladu abs.svg"
        }

        Image {
            id: thirdRightIndicator
            width: 56.83
            height: 36.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: secondRightIndicator.top
                bottomMargin: 20
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/System wspomagania parkowania.svg"
        }

        Image {
            id: secondRightIndicator
            width: 56.83
            height: 36.17
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: firstRightIndicator.top
                bottomMargin: 20
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/awaria_ukladu_hamulcowego.svg"
        }

        Image {
            id: firstRightIndicator
            width: 36
            height: 45
            anchors {
                right: parent.right
                rightMargin: 50
                bottom: parent.bottom
                bottomMargin: 10
            }
            opacity: 1
            source: "qrc:/assets/ipz_grafiki/niezapietepasybezpieczenstwa.svg"
        }


        /*
            -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            Left Progress Bar
        */

        // RadialBar {
        //     id:radialBar
        //     anchors{
        //         verticalCenter: parent.verticalCenter
        //         left: parent.left
        //         leftMargin: parent.width / 6
        //     }

        //     width: 338
        //     height: 338
        //     penStyle: Qt.RoundCap
        //     dialType: RadialBar.NoDial
        //     progressColor: "#01E4E0"
        //     backgroundColor: "transparent"
        //     dialWidth: 17
        //     startAngle: 270
        //     spanAngle: 3.6 * value
        //     minValue: 0
        //     maxValue: 100
        //     value: batteryChargeValue

        //     textFont {
        //         family: "inter"
        //         italic: false
        //         bold: Font.Medium
        //         pixelSize: 60
        //     }
        //     showText: false
        //     suffixText: ""
        //     textColor: "#FFFFFF"

        //     ColumnLayout{
        //         anchors.centerIn: parent
        //         Label{
        //             text: radialBar.value + "%"
        //             font.pixelSize: 65
        //             font.family: "Inter"
        //             font.bold: Font.Normal
        //             color: "#FFFFFF"
        //             Layout.alignment: Qt.AlignHCenter
        //         }

        //         Label{
        //             text: "Battery charge"
        //             font.pixelSize: 28
        //             font.family: "Inter"
        //             font.bold: Font.Normal
        //             opacity: 0.8
        //             color: "#FFFFFF"
        //             Layout.alignment: Qt.AlignHCenter
        //         }
        //     }
        // }

        /*
            -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            Right Info
        */

        ColumnLayout{
            spacing: 40

            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: parent.width / 6
            }

            RowLayout{
                spacing: 30
                Image {
                    width: 90
                    height: 50
                    source: "qrc:/assets/Group 28.svg"
                }

                ColumnLayout{
                    Label{
                        text: distanceValue + "KM"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Distance"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
            RowLayout{
                spacing: 30
                Image {
                    width: 72
                    height: 78
                    source: "qrc:/assets/fuel.svg"
                }

                ColumnLayout{
                    Label{
                        text: fuelValue + "l"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Avg. Fuel Usage"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
            RowLayout{
                id:speed
                spacing: 30
                Image {
                    width: 78.72
                    height: 78.68
                    source: "qrc:/assets/speedometer.svg"
                }

                ColumnLayout{
                    Label{
                        text: avgSpeedValue + "km/h"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Avg. Speed"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
        }
    }
}
