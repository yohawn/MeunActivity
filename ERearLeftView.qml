import QtQuick 2.6
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    width: parent.width
    height: parent.height
    color: "#191919"

    property alias alias_backButton : id_backButton
    property alias alias_ListView : id_ListView
    property bool informationButton : false
    property alias alias_highbar: element

    Rectangle {
        id: textrectangle
        width:parent.width
        height: 65
        anchors.top : id_backButtonArea.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        color: "#3e3e3e"
        anchors.leftMargin: 21
        anchors.rightMargin: 20

        Text{
            id: element
            anchors.centerIn: parent
            text: LalistRearLeftActivity_Qml.qml_name
            color: "white"
            font.pixelSize: 40
            font.bold: true
        }
        MouseArea{
            onClicked: {
                informationButton=false
            }
        }
    }
    Rectangle {
        id: id_backButtonArea
        width: parent.width
        height: 105
        color:"#191919"
        x:0
        y:0
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
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
            }

            onClicked: {
                eRearLeftViewloader.visible = false
            }
        }
    }



    Rectangle {
        width: parent.width
        height:525
        anchors.top:textrectangle.bottom
        anchors.right: parent.right
        color:"#191919"

        ListView {
            id:id_ListView
            width: parent.width
            height: parent.height

            model: LalistRearLeftActivity_Qml

            delegate: Item {
                width: parent.width
                height: 525


                Rectangle{
                    id:detailview1
                    width: 1063
                    height:150
                    color:"#191919"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 22//195 마진 계산
                    anchors.leftMargin: 20

                    Rectangle{
                        id:foodName_Image
                        width: 50
                        height:50
                        color:"#191919"

                        Image {
                            source:if(isiceERear(model.qml_subSymbol)) "qrc:resource/ice.png"
                                   else if(isbugerERear(model.qml_subSymbol)) "qrc:resource/burger.png"
                                   else if(!isbugerERear(model.qml_subSymbol)&&!isiceERear(model.qml_subSymbol)) "qrc:resource/rest.png"
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
                            text: model.qml_name
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
                        anchors.top:foodName_Image.bottom
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
                        anchors.top:foodName_Text.bottom
                        anchors.topMargin:11
                        anchors.left:foodPhone_Image.right
                        anchors.leftMargin: 15
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
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }

                    }
                    Rectangle{
                        id:foodOpenTime_Text
                        width:972
                        height: 56
                        color: "#191919"
                        anchors.top:foodOpentime_Image.top
                        anchors.topMargin:13
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
                anchors.right: parent.right
                anchors.rightMargin: 20
                background: Rectangle {
                    color: "grey"
                }
            }

        }
    }

    function isiceERear(qml_subSymbol) {
        if (qml_subSymbol.indexOf("2010711") !== -1) {
            return true;
        } else {
            return false;
        }
    }
    function isbugerERear(qml_subSymbol) {
            if (qml_subSymbol.indexOf("2010722") !== -1
                ||qml_subSymbol.indexOf("2010701") !== -1
                ||qml_subSymbol.indexOf("2010723") !== -1
                ||qml_subSymbol.indexOf("2010708") !== -1
                ||qml_subSymbol.indexOf("2010704") !== -1) {
                return true;
            } else {
                return false;
            }

        }

}

