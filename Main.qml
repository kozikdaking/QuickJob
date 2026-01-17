import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 360
    height: 640
    minimumWidth: 300
    minimumHeight: 400
    visible: true
    title: qsTr("QuickJob")
    color: "#0d1919"

    Item {
        id: mainContainer
        anchors.fill: parent

        readonly property real baseWidth: 360
        readonly property real baseHeight: 640
        readonly property real scaleFactor: Math.min(
            mainContainer.width / baseWidth,
            mainContainer.height / baseHeight
        )

        Item {
            id: base
            width: mainContainer.baseWidth
            height: mainContainer.baseHeight
            anchors.centerIn: parent
            scale: mainContainer.scaleFactor

            // --- STACKVIEW (OBSZAR TREŚCI) ---
            StackView {
                id: mainStack
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: bottomBar.top
                initialItem: homeComponent
            }

            // --- DOLNY PASEK (NAWIGACJA) ---
            Rectangle {
                id: bottomBar
                height: 50
                width: parent.width
                color: "#142424"
                anchors.bottom: parent.bottom

                Row {
                    anchors.fill: parent

                    // PRZYCISK: SZUKAJ (HOME)
                    Button {
                        id: homeButton
                        width: parent.width / 5
                        height: parent.height
                        hoverEnabled: true
                        flat:true
                        onClicked: {
                            mainStack.replace(homeComponent)
                        }
                        background: Rectangle {
                            radius: 10
                            color: bottomBar.color
                            Image
                            {
                                anchors.fill: parent
                                anchors.bottomMargin: 10
                                source: "images/findgray"
                                scale: 0.6
                            }

                            Text {
                                id: homeText
                                text: "Szukaj"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                color:"gray"
                            }
                        }
                    }

                    // PRZYCISK: ULUBIONE
                    Button {
                        id: favoriteButton
                        width: parent.width / 5
                        height: parent.height
                        onClicked:
                        {
                            mainStack.replace("favorite.qml")
                        }
                        background: Rectangle {
                            radius: 10
                            color: bottomBar.color
                            Text {
                                id: favoriteText
                                text: "Ulubione"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                color: "gray"
                            }
                        }
                    }

                    // PRZYCISK: DODAJ (+)
                    Button {
                        id: addButton
                        width: parent.width / 5
                        height: parent.height
                        onClicked:
                        {
                            mainStack.replace("add.qml")
                        }
                        background: Rectangle {
                            radius: 10
                            color: bottomBar.color
                            Text {
                                id: addText
                                text: "+"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                color: "gray"
                                font.pixelSize: 20
                            }
                        }
                    }

                    // PRZYCISK: CZAT (PRZEŁĄCZANIE)
                    Button {
                        id: chatButton
                        width: parent.width / 5
                        height: parent.height
                        onClicked:
                        {
                            mainStack.replace("chat.qml")
                        }
                        background: Rectangle {
                            radius: 10
                            color: bottomBar.color
                            Text {
                                id: chatText
                                text: "Czat"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                color: "gray"
                            }
                        }
                    }

                    // PRZYCISK: KONTO
                    Button {
                        id: accountButton
                        width: parent.width / 5
                        height: parent.height
                        onClicked:
                        {
                            mainStack.replace("account.qml")
                        }
                        background: Rectangle {
                            radius: 10
                            color: bottomBar.color
                            Text {
                                id: accountText
                                text: "Konto"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                color: "gray"
                            }
                        }
                    }
                } // Koniec Row
            } // Koniec bottomBar
        } // Koniec base
    } // Koniec mainContainer

    // --- KOMPONENT STRONY GŁÓWNEJ (HOME) ---
    Component {
        id: homeComponent
        Item {
            anchors.fill: parent
            // GÓRNY PASEK
            Rectangle {
                id: searchBackground
                height: 65
                width: parent.width
                color: "#142424"

                TextField {
                    id: searchField
                    height: 40
                    width: parent.width * 0.8
                    color: "#8C9A9D"
                    placeholderText: "Wyszukaj nazwę"
                    placeholderTextColor: "#8C9A9D"
                    anchors.left: parent.left
                    anchors.leftMargin: 9
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 13
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#0d1919"
                        radius: 5
                    }
                }

                Rectangle {
                    id: notifications
                    height: 40
                    width: 40
                    color: "#142424"
                    anchors.left: searchField.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.centerIn: parent
                        text: "🔔"
                        font.pixelSize: 25
                    }
                }
            }

            // KATEGORIE
            Rectangle {
                id: categories
                anchors.top: searchBackground.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#0d1919"

                Text {
                    id: textCat
                    text: "Przeglądaj kategorie"
                    color: "white"
                    font.pixelSize: 21
                    font.bold: true
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 9
                }

                Grid {
                    columns: 5
                    rows: 2
                    spacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: textCat.bottom
                    anchors.topMargin: 20

                    Repeater {
                        model: 10
                        Rectangle {
                            width: 50
                            height: 50
                            color: "green"
                            radius: width / 2
                        }
                    }
                }
            }
        }
    }
}
