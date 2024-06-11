import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1


Window {
    property int font_size: 26
    width: 1080
    height: 1920
    visible: true
    title: "Second_Panel"
    color: "#000000"
    visibility: "Windowed"

    Rectangle {
        id: second_panel
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        Rectangle {
                id: menu
                width: parent.width
                height: (parent.height / 100) * 10
                color: "#800000"
                anchors.top: parent.top
                Button {
                    id: option1
                    Text {
                        text: "Radio"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: parent.left
                    onClicked: {
                        display_radio.visible = true
                        display_nav.visible = false
                        display_ac.visible = false
                        display_windows.visible = false
                        display_stats.visible = false
                        display_settings.visible = false
                    }

                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/Lights.svg"
                        fillMode: Image.fillMode
                    }
                }

                Button {
                    id: option2
                    Text {
                        text: "Navigation"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: option1.right
                    onClicked: {
                        display_radio.visible = false
                        display_nav.visible = true
                        display_ac.visible = false
                        display_windows.visible = false
                        display_stats.visible = false
                        display_settings.visible = false
                    }
                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/FirstRightIcon.svg"
                        fillMode: Image.fillMode
                    }
                }

                Button {
                    id: option3
                    Text {
                        text: "A/C"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: option2.right
                    onClicked: {
                        display_radio.visible = false
                        display_nav.visible = false
                        display_ac.visible = true
                        display_windows.visible = false
                        display_stats.visible = false
                        display_settings.visible = false
                    }
                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/coffee.svg"
                        fillMode: Image.fillMode
                    }
                }

                Button {
                    id: option4
                    Text {
                        text: "Windows"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: option3.right
                    onClicked: {
                        display_radio.visible = false
                        display_nav.visible = false
                        display_ac.visible = false
                        display_windows.visible = true
                        display_stats.visible = false
                        display_settings.visible = false
                    }
                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/TEST_IMAGE.jpg"
                        fillMode: Image.fillMode
                    }
                }

                Button {
                    id: option5
                    Text {
                        text: "Stats"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: option4.right
                    onClicked: {
                        display_radio.visible = false
                        display_nav.visible = false
                        display_ac.visible = false
                        display_windows.visible = false
                        display_stats.visible = true
                        display_settings.visible = false
                    }
                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/TEST_IMAGE.jpg"
                        fillMode: Image.fillMode
                    }
                }

                Button {
                    id: option6
                    Text {
                        text: "Settings"
                        color: "White"
                        anchors.centerIn: parent
                        font.family: "Helvetica"
                        font.pointSize: 26
                    }
                    background: Rectangle {
                        height: parent.height
                        width: parent.width
                        color: "#000000"
                    }
                    width: parent.width / 6
                    height: parent.height
                    anchors.left: option5.right
                    onClicked: {
                        display_radio.visible = false
                        display_nav.visible = false
                        display_ac.visible = false
                        display_windows.visible = false
                        display_stats.visible = false
                        display_settings.visible = true
                    }
                    Image {
                        visible: false
                        anchors.fill: parent
                        source: "qrc:/assets/coffee.svg"
                        fillMode: Image.fillMode
                    }
                }
            }

        Rectangle {
            id: display
            width: parent.width
            height: (parent.height / 100) * 90
            Image {
                id: image_display_1
                anchors.fill: parent
                source: "qrc:/assets/TEST_IMAGE.jpg"
                fillMode: Image.fillMode
            }
            color: "#ffcccc"
            anchors.bottom: parent.bottom

            Rectangle {
                id: display_ac
                visible: false
                width: parent.width
                height: parent.height
                color: "#ffff00"
            }
            Rectangle {
                id: display_settings
                visible: false
                width: parent.width
                height: parent.height
                color: "#660066"
            }
            Rectangle {
                id: display_radio
                visible: true
                width: parent.width
                height: parent.height
                color: "#3FF0BA"
                Rectangle {
                    width: parent.width
                    height: parent.height * 0.3
                    color: "#FFFFFF"
                    anchors.top: parent.top

                }
                Rectangle {
                    width: parent.width
                    height: parent.height * 0.7
                    color: "#000000"
                    anchors.bottom: parent.bottom
                }
            }
            Rectangle {
                id: display_windows
                visible: false
                width: parent.width
                height: parent.height
                color: "#01F05F"
            }
            Rectangle {
                id: display_stats
                visible: false
                width: parent.width
                height: parent.height
                color: "#000000"
            }
            Rectangle {
                id: display_nav
                visible: false
                width: parent.width
                height: parent.height
                color: "#FFFFFF"
            }
        }
    }
}
