import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 360
    height:640
    minimumWidth: 300
    minimumHeight: 400
    visible: true
    title: qsTr("QuickJob")
    color: "#0d1919"
    // Główne tło aplikacji


    // Kontener, który zarządza skalowaniem
    Item {
        id: mainContainer
        anchors.fill: parent

        // Właściwości pomocnicze do obliczeń
        readonly property real baseWidth: 360
        readonly property real baseHeight: 640

        // Obliczamy skalę tak, aby UI zawsze mieściło się w oknie (proporcja "contain")
        readonly property real scaleFactor: Math.min(
            mainContainer.width / baseWidth,
            mainContainer.height / baseHeight
        )

        // BAZOWY PROJEKT UI
        Item {
            id: base
            width: mainContainer.baseWidth
            height: mainContainer.baseHeight
            anchors.centerIn: parent

            // To jest klucz do poprawnego skalowania bez przesuwania elementów
            scale: mainContainer.scaleFactor

            Rectangle {
                id: background
                anchors.fill: parent
                color:"#0d1919"

                // --- GÓRNY PASEK (Wyszukiwarka + Notyfikacje) ---


                Rectangle
                {
                    id:searchBackground
                    height:65
                    width:parent.width
                    color:"#142424"

                    TextField {
                        id: searchField
                        height: 40
                        width: parent.width * 0.8
                        color:"#8C9A9D"
                        placeholderText: "Wyszukaj nazwę"
                        placeholderTextColor: "#8C9A9D"
                        anchors.left: parent.left
                        anchors.leftMargin: 9
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        verticalAlignment: Text.AlignVCenter

                        background: Rectangle
                        {
                            anchors.fill:parent
                            color:"#0d1919"
                        }
                    }

                    Rectangle {
                        id: notifications
                        height: 40
                        width: 40
                        color: "#142424"
                        anchors.left: searchField.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: searchBackground.verticalCenter

                        Text {
                            anchors.centerIn: parent
                            text: "🔔"
                            font.pixelSize: 25
                        }
                    }
                }



                // --- ŚRODEK (Kategorie) ---

                Rectangle {
                    id: categories
                    height: 200
                    width: parent.width
                    anchors.top: searchBackground.bottom
                    anchors.left: parent.left
                    color:"#0d1919"

                    Text {
                        text: "Przeglądaj kategorie"
                        color: "white"
                        font.pixelSize: 21
                        font.bold: true
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 10
                        anchors.leftMargin: 9

                    }
                }

                // --- DOLNY PASEK PRZYCISKÓW ---
                Rectangle {
                    id: bottomBar
                    height: 50
                    width: parent.width
                    color: "#142424"
                    anchors.bottom: parent.bottom

                    Row {
                        anchors.fill: parent

                            Button {
                                id:homeButton
                                width: parent.width / 5
                                height: parent.height
                                background: Rectangle
                                {
                                    radius:10
                                    color:bottomBar.color
                                    Text
                                    {
                                        id:homeText
                                        text:"Szukaj"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 5
                                        color:"gray"
                                    }
                                }
                            }
                            Button {
                                id:favoriteButton
                                width: parent.width / 5
                                height: parent.height
                                background: Rectangle
                                {
                                    radius:10
                                    color:bottomBar.color
                                    Text
                                    {
                                        id:favoriteText
                                        text:"Ulubione"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 5
                                        color:"gray"
                                    }
                                }
                            }
                            Button {
                                id:addButton
                                width: parent.width / 5
                                height: parent.height
                                background: Rectangle
                                {
                                    radius:10
                                    color:bottomBar.color
                                    Text
                                    {
                                        id:addText
                                        text:"+"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        color:"gray"
                                    }
                                }
                            }
                            Button {
                                id:chatButton
                                width: parent.width / 5
                                height: parent.height
                                background: Rectangle
                                {
                                    radius:10
                                    color:bottomBar.color
                                    Text
                                    {
                                        id:chatText
                                        text:"Czat"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 5
                                        color:"gray"
                                    }
                                }
                            }
                            Button {
                                id:accountButton
                                width: parent.width / 5
                                height: parent.height

                                background: Rectangle
                                {
                                    radius:10
                                    color:bottomBar.color
                                    Text
                                    {
                                        id:accountText
                                        text:"Konto"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 5
                                        color:"gray"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

