import QtQuick 2.6
import QtQuick.Controls 2.12
import QtQuick 2.6
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id:parntRectangle
    width: parent.width
    height: parent.height
    color: "#191919"

    Rectangle {
        id: id_backButtonArea
        width: parent.width - 40
        height: 105
        color:"#191919"
        anchors.top:parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin:20

        Button {
            id: id_backButton
            width: 90
            height: 105
            background: Rectangle {
                color: "#191919"
            }
            Image {
                source:  "qrc:/resource/back.png"
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            onClicked: {
                efrontViewloader.visible = false
            }
        }
    }

    Rectangle {
        id: textrectangle
        width:parent.width
        height: 65
        color: "#3e3e3e"
        anchors.top : id_backButtonArea.bottom
        anchors.left:parent.left
        anchors.leftMargin: 21
        anchors.right:parent.right
        anchors.rightMargin: 20


        Text{
            id: element
            anchors.centerIn: parent
            text: LalistFrontActivity_Qml.qml_name
            color: "white"
            font.pixelSize: 40
            font.bold: true
        }


    }

    Rectangle {
        width: parent.width
        height: 525
        color:"#191919"
        anchors.top:textrectangle.bottom
        anchors.right: parent.right

        ListView {
            id:id_ListView
            width: parent.width
            height: 525
            model: LalistFrontActivity_Qml
            delegate: Item {
                width: parent.width
                height: 525

                Rectangle{
                    id:detailview1
                    width: 1063
                    height:150
                    color:"#191919"
                    anchors.top:parent.top
                    anchors.topMargin: 22
                    anchors.left: parent.left
                    anchors.leftMargin: 20

                    Rectangle{
                        id:foodName_Image
                        width: 50
                        height:50
                        color:"#191919"

                        Image {
                            source:
                                if(isicefront(model.qml_symbolCode)) "qrc:resource/ice.png"
                               else if(isbugerfront(model.qml_symbolCode)) "qrc:resource/burger.png"
                               else if(!isbugerfront(model.qml_symbolCode)&&!isicefront(model.qml_symbolCode)) "qrc:resource/rest.png"
                            width: parent.width
                            height: parent.height
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }
                    Rectangle{
                        id:foodName_Text
                        width:978
                        height: 50
                        color: "#191919"
                        anchors.left:foodName_Image.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: foodName_Image.verticalCenter

                        Text {
                            text:  model.qml_name
                            color: "white"
                            font.pixelSize: 28
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Rectangle{
                        id:foodAddress_Image
                        width: 50
                        height:50
                        color:"#191919"
                        anchors.top:foodName_Image.bottom
                        anchors.topMargin: 7

                        Image {
                            source: "qrc:/resource/pin.png"
                            width: parent.width
                            height: parent.height
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }
                    Rectangle{
                        id:foodAddress_Text
                        width:978
                        height: 50
                        color: "#191919"
                        anchors.top: foodName_Text.bottom
                        anchors.topMargin:11
                        anchors.left:foodAddress_Image.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: foodAddress_Image.verticalCenter

                        Text {
                            text:  model.qml_address
                            color: "white"
                            font.pixelSize: 28
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }


                    Rectangle{
                        id:foodPhone_Image
                        width: 50
                        height:50
                        color:"#191919"
                        anchors.top:foodAddress_Image.bottom
                        anchors.topMargin: 7

                        Image {
                            source: "qrc:/resource/phone.png"
                            width: parent.width
                            height: parent.height
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }
                    Rectangle{
                        id:foodPhone_Text
                        width:978
                        height: 50
                        color: "#191919"
                        anchors.top:foodAddress_Text.bottom
                        anchors.topMargin: 11
                        anchors.left:foodPhone_Image.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: foodPhone_Image.verticalCenter

                        Text {
                            text:  model.qml_phone
                            color: "white"
                            font.pixelSize: 28
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Rectangle{
                        id:foodOpentime_Image
                        width: 56
                        height:56
                        color:"#191919"
                        anchors.top:foodPhone_Image.bottom
                        anchors.topMargin: 31
                        anchors.left: parent.left
                        anchors.leftMargin: 96

                        Image {
                            source: "qrc:/resource/opentime.png"
                            width: parent.width
                            height: parent.height
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }
                    Rectangle{
                        id:foodOpenTime_Text
                        width:972
                        height: 56
                        color: "#191919"
                        anchors.top:foodOpentime_Image.top
                        anchors.topMargin: 13
                        anchors.left:foodOpentime_Image.right
                        anchors.leftMargin: 15

                        Text {
                            id:id_opentime
                            text: "영업 시간"
                            color: "white"
                            font.pixelSize: 28
                            font.bold: true

                        }
                        Text{
                            text:model.qml_opentime
                            color: "white"
                            font.pixelSize: 28
                            anchors.top:id_opentime.bottom
                            padding: 7

                        }
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: Qt.ScrollBarAlwaysOn
                size: 16
                anchors.right:parent.right
                anchors.rightMargin: 20
                background: Rectangle {
                    color: "grey"
                }
            }
        }
    }
    function isicefront(qml_symbolCode) {
        if (qml_symbolCode.indexOf("2010711") !== -1) {
            return true;
        } else {
            return false;
        }
    }
    function isbugerfront(qml_symbolCode) {
            if (qml_symbolCode.indexOf("2010722") !== -1
                ||qml_symbolCode.indexOf("2010701") !== -1
                ||qml_symbolCode.indexOf("2010723") !== -1
                ||qml_symbolCode.indexOf("2010708") !== -1
                ||qml_symbolCode.indexOf("2010704") !== -1) {
                return true;
            } else {
                return false;
            }

        }

}



