import QtQuick
import QtQuick.Controls 2.15

Item {
Rectangle
{
    id:background
    anchors.fill: parent
    color:"#0d1919"
    Text {
        id: titleText
        text: qsTr("Tytuł ogłoszenia")
        color:"white"
        font.bold: true
        font.pixelSize: 14
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.topMargin: 20
        anchors.leftMargin: 20
    }
    TextField
    {
        id:titleField
        height:40
        width:250
        color:"#8C9A9D"
        anchors.top: titleText.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        verticalAlignment: Text.AlignVCenter
        placeholderText: "Wpisz tytuł ogłoszenia"
        placeholderTextColor: "#8C9A9D"
        background: Rectangle
        {
            color:"#142424"
            radius:4
        }

        Text
        {
            id:chooseCategoryText
            text:"Wybierz kategorię"
            font.pixelSize: 14
            font.bold: true
            color:"white"
            anchors.top: titleField.bottom
            anchors.topMargin: 10
        }

        ComboBox {
            id: chooseCategory
            height: 40
            width: 250
            model: ["Odśnieżanie", "Zamiatanie", "Pomoc fizyczna", "Koszenie trawy"]

            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: chooseCategoryText.bottom
            anchors.topMargin: 10

            background: Rectangle {
                color: "#142424"
                radius: 4
            }

            delegate: ItemDelegate {
                width: chooseCategory.width
                height: 40

                text: modelData

                background: Rectangle {
                    color: highlighted ? "#1f3a3a" : "#142424"
                }

                contentItem: Text {
                    text: modelData
                    color: "#8C9A9D"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 10
                    elide: Text.ElideRight
                }

}

    }
    }
}
}
