import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: "ListActivityView"
    color:"#191919"

    property bool efrontViewloadervisible : false
    property bool eRearRightViewloadervisible : false
    property bool eRearLeftViewloadervisible: false
    property bool areaEnter: false
    property bool efrontViewPressed: false
    property bool eRearRightViewPressed: false
    property bool eRearLeftViewPressed: false
    property int  clickindex: -1

    ListView {
        id:iistActivity
        width: 1238
        height: 528
        anchors.top: rectangle.bottom
        anchors.bottom: parent.bottom
        model: ListActivity_Qml // Using the exposed model from main.cpp


        delegate: Item {
            width: 1238
            height: 106
            Rectangle{
                width: parent.width
                height:parent.height
                color:"#191919"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 10.2
                anchors.left: parent.left
                anchors.leftMargin: 21

                Rectangle{
                    width:1009
                    height:106
                    color:"#191919"
                    border.color: "#608ab9"
                    border.width: 1

                    Rectangle{
                        id:imagerectangle
                        width:90
                        height:95
                        color:"#191919"

                        anchors.left: parent.left
                        anchors.leftMargin: 4
                        anchors.verticalCenter: parent.verticalCenter


                        Rectangle{
                            width:64
                            height:64
                            color:"#191919"

                            anchors.bottom: imagerectangle.bottom
                            anchors.bottomMargin: 20
                            anchors.centerIn: parent


                            Image {
                                source:if(isice(model.symbolCode_qml)) "qrc:resource/ice.png"
                                       else if(isbuger(model.symbolCode_qml)) "qrc:resource/burger.png"
                                       else if(!isbuger(model.symbolCode_qml)&&!isice(model.symbolCode_qml)) "qrc:resource/rest.png"
                                width: 64
                                height: 64
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter

                            }
                        }

                    }

                    Text {

                        text: "전석"
                        font.pixelSize: 40
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        color:if(-1 == clickindex) "white"
                              else if(eRearLeftViewPressed || eRearRightViewPressed) "grey"

                              else if(clickindex != index) "grey"
                        anchors.verticalCenter: parent.verticalCenter//수직
                        font.bold: true


                    }

                    Text {
                        id:nametext
                        text: model.name_qml
                        font.pixelSize: 40
                        anchors.left: imagerectangle.right
                        color:if(-1 == clickindex) "white"
                              else if(eRearLeftViewPressed || eRearRightViewPressed) "grey"
                              else if(clickindex != index) "grey"
                        font.bold: true
                        padding: 7
                    }

                    Text {
                        text: model.address_qml
                        font.pixelSize: 25
                        anchors.left: nametext.left
                        anchors.leftMargin: 10
                        anchors.top: nametext.bottom
                        color:if(-1 == clickindex) "white"
                              else if(eRearLeftViewPressed || eRearRightViewPressed) "grey"
                              else if(clickindex != index) "grey"
                        font.bold: true

                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "transparent"

                    MouseArea {
                        id:listclick
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){
                                       if(!areaEnter)
                                       {
                                           clickindex = index;
                                           areaEnter = true;
                                           parent.color = Qt.rgba(128,128,128,0.5)
                                       }
                                       efrontViewPressed = true;
                                   }
                        onReleased:{
                            efrontViewPressed =false;
                        }
                        onEntered: {


                        }
                        onExited: {
                            if(areaEnter)
                            {
                                parent.color = "transparent"
                                areaEnter = false;
                            }
                        }
                        onClicked: if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){
                                       clickindex = -1;
                                       console.log("MouseAreaclicked")
                                       iistActivity.currentIndex = index

                                       efrontViewloader.visible = true
                                       LalistFrontActivity_Qml.onItemClicked(index)
                                       parent.color = "transparent"
                                       //                                       button1.enabled : false
                                       //                                       button2.enabled : false
                                   }
                    }
                }

                Rectangle {
                    id: buttonrectangle1
                    width:99
                    height: parent.height
                    anchors.right:buttonrectangle2.left


                    Button {
                        id: button1
                        width: parent.width
                        height: parent.height
                        background: Rectangle {
                            color: "blue"
                            border.color: "#608ab9"
                            border.width: 1
                        }

                        Text {
                            text: "후석\n  L"
                            color: if(-1 == clickindex) "white"
                                   else if(efrontViewPressed || eRearRightViewPressed) "grey"
                                   else if(clickindex != index) "grey"

                            anchors.centerIn: parent
                            font.pixelSize: 30
                            font.bold: true
                        }
                        onPressed:if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){
                                      eRearLeftViewPressed = true;
                                      clickindex = index;

                                      if(!areaEnter)
                                      {
                                          areaEnter = true;
                                          buttonrectangle1.color = Qt.rgba(128,128,128,0.5)
                                      }
                                  }
                        onReleased: {

                            eRearLeftViewPressed = false;
                        }

                        onClicked: if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){
                                       clickindex = -1;
                                       eRearLeftViewloader.visible = true
                                       LalistRearLeftActivity_Qml.onItemClicked(index)
                                   }

                    }
                }

                Rectangle {
                    id: buttonrectangle2
                    width:99
                    height: parent.height
                    anchors.right: parent.right


                    Button {
                        id:button2
                        width:parent.width
                        height: parent.height
                        anchors.right: parent.right

                        background: Rectangle {
                            color: "#0cab57"
                            border.color: "#608ab9"
                            border.width: 1
                        }
                        Text {
                            text: "후석\n R"
                            color: if(-1 == clickindex) "white"
                                   else if(efrontViewPressed || eRearLeftViewPressed) "grey"
                                   else if(clickindex != index) "grey"

                            anchors.centerIn: parent
                            font.pixelSize: 30
                            font.bold: true

                        }
                        onPressed: if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){

                                       eRearRightViewPressed = true;
                                       if(!areaEnter)
                                       {
                                           clickindex = index;

                                           areaEnter = true;
                                           parent.color = Qt.rgba(128,128,128,0.5)
                                       }
                                   }
                        onReleased: {

                            eRearRightViewPressed = false;
                        }
                        onClicked: if(!eRearRightViewloader.visible&&!eRearLeftViewloader.visible&&!efrontViewloader.visible){
                                       clickindex = -1
                                       console.log("eRearRightViewloader.visible"+eRearRightViewloader.visible)
                                       eRearRightViewloader.visible  = true
                                       LalistRearRightActivity_Qml.onItemClicked(index)

                                   }
                    }

                }

            }


        }
        ScrollBar.vertical: ScrollBar {

            policy: Qt.ScrollBarAlwaysOn
            size: 16


            background: Rectangle {
                color: "grey"
            }


        }
    }
    Rectangle {
        id: rectangle
        x: 0
        width:1280
        height:66
        anchors.top : parent.top
        //anchors.bottom : listView.top
        anchors.right: parent.right
        anchors.left: parent.left
        color: "#191919"
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Text{
            id: element
            anchors.top : parent.top
            anchors.bottom : parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.centerIn: parent //가운데정렬
            text: "식당 "+ ListActivity_Qml.indexNumber//cpp Q_PROPERTY int count랑연결
            color: "white"
            font.pixelSize: 50
            font.bold: true
        }

    }

    function isice(symbolCode_qml) {
        if (symbolCode_qml.indexOf("2010711") !== -1) {
            return true;
        } else {
            return false;
        }
    }

    function isbuger(symbolCode_qml) {
        if (symbolCode_qml.indexOf("2010722") !== -1
                ||symbolCode_qml.indexOf("2010701") !== -1
                ||symbolCode_qml.indexOf("2010723") !== -1
                ||symbolCode_qml.indexOf("2010708") !== -1
                ||symbolCode_qml.indexOf("2010704") !== -1) {
            return true;
        } else {
            return false;
        }

    }

    Loader {
        id: eRearLeftViewloader
        anchors.fill: parent
        source: "ERearLeftView.qml";
        visible: eRearLeftViewloadervisible
    }
    Loader {
        id: efrontViewloader
        anchors.fill: parent
        source: "EfrontView.qml";
        visible: efrontViewloadervisible
    }
    Loader {
        id: eRearRightViewloader
        anchors.fill: parent
        source: "ERearRightView.qml";
        visible: eRearRightViewloadervisible
    }

}


