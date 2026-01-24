import QtQuick
import QtQuick.Controls 2.15

Item {
ScrollView
{
//========================= SCROLL ===================================
    id:scrollView
    anchors.fill: parent
    contentWidth: availableWidth
    contentHeight: contentLayout.height
    ScrollBar.vertical.policy: ScrollBar.AlwaysOff
//========================= SCROLL ===================================
    Rectangle
    {
    id: background
    anchors.fill: parent
    color: "#0d1919"
    z: -1
    }

Item
{
    id:contentLayout
    width:scrollView.availableWidth
    height:1000
    Text {
        id: titleText
        text: qsTr("Tytuł ogłoszenia")
        color:"white"
        font.pixelSize: 14
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.topMargin: 200
        anchors.leftMargin: 20
    }
    //========================= IMAGE ===================================
Text
{
    id:imageButtonText
    text:"Dodaj zdjęcie"
    color:"white"
    font.pointSize: 14
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:parent
    anchors.topMargin: 10
}
    Button
    {
        id:imageButton
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.top: imageButtonText.bottom
        anchors.topMargin: 15
        height:150
        width:250
    }

    //========================= IMAGE ===================================

    //========================= TITLE ===================================
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
            color:"white"
            anchors.top: titleField.bottom
            anchors.topMargin: 10
        }
}

    //========================= TITLE =======================================

    //========================= COMBO BOX ===================================
        ComboBox {
            id: chooseCategory
            height: 40
            width: 250
            currentIndex:0
            model: ["Wybierz kategorię","Odśnieżanie", "Zamiatanie", "Pomoc fizyczna", "Koszenie trawy"]
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: titleField.bottom
            anchors.topMargin: 40
            contentItem: Text
            {
                text:chooseCategory.displayText
                 color:"#8C9A9D"
                 verticalAlignment: Text.AlignVCenter
                 anchors.left:parent
                 anchors.leftMargin:20
            }

            background: Rectangle {
                color: "#142424"
                radius: 4
            }

            delegate: ItemDelegate {
                width: chooseCategory.width
                height: 40

                text: modelData

                background: Rectangle {
                    color: hovered ? "#1f3a3a" : "#142424"
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
        //========================= COMBO BOX ===================================

        //========================= OPIS ========================================
        Text
        {
            id:descriptionText
            color:"white"
            text:"Opis"
            font.pixelSize: 14

            anchors.left: parent.left
            anchors.leftMargin:20
            anchors.top:chooseCategory.bottom
            anchors.topMargin: 10
        }
        TextField
        {
            id:descriptionField
            height:200
            width:parent.width*0.80
            color:"#8C9A9D"
            maximumLength:300

            anchors.left: parent.left
            anchors.leftMargin:20
            anchors.top: descriptionText.bottom
            anchors.topMargin: 10
            wrapMode: Text.Wrap

            placeholderText:"Wpisz opis..."
            placeholderTextColor: "#8C9A9D"

            background: Rectangle
            {
                id:descRect
                color:"#142424"
                anchors.fill:parent
                radius:4
            }
            Text
            {
                id:maxLenght
                text:"Liczba znaków: " + descriptionField.length  + " / 300"
                color: descriptionField.length>290 ? "red":"#8C9A9D"
                font.pixelSize: 13

                anchors.right: descriptionField.right
                anchors.rightMargin:0
                anchors.top: descriptionField.bottom
                anchors.topMargin: 10
            }
        }

        //========================= OPIS ===========================================

         //========================= KONTAKT ========================================

        Text
        {
            id:contactText
            text:"Kontakt do Ciebie"
            color:"white"
            font.pixelSize: 18
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: descriptionField.bottom
            anchors.topMargin:40
        }
            Text
            {
                id:adressText
                text:"Miejscowość"
                color:"white"
                font.pixelSize: 14
                font.bold: false
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: contactText.bottom
                anchors.topMargin:10
            }
        TextField
        {
            id:adressField
            height:40
            width:250
            color:"#8C9A9D"
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: adressText.bottom
            anchors.topMargin: 10

            placeholderText: "Miejscowość"
            placeholderTextColor: "#8C9A9D"
            background: Rectangle
            {
                anchors.fill:parent
                color:"#142424"
                radius:4
            }

            }

        Text
        {
            id:phoneNumberText
            text:"Numer telefonu"
            color:"white"
            font.pixelSize: 14
            font.bold: false
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: adressField.bottom
            anchors.topMargin:10
        }

        TextField
            {
                id:phoneNumberField
                height:40
                width:250
                color:"#8C9A9D"

                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: phoneNumberText.bottom
                anchors.topMargin: 10
                placeholderText: "Numer telefonu"
                placeholderTextColor: "#8C9A9D"
                maximumLength:9

                background: Rectangle
                {
                    anchors.fill:parent
                    color:"#142424"
                    radius:4
                }
            }
        Text
        {
            id:personText
            text:"Osoba kontaktowa"
            color:"white"
            font.pixelSize: 14
            font.bold: false
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: phoneNumberField.bottom
            anchors.topMargin:10
        }
        TextField
            {
                id:personField
                height:40
                width:250
                color:"#8C9A9D"

                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: personText.bottom
                anchors.topMargin: 10
                placeholderText: "Np. Marek"
                placeholderTextColor: "#8C9A9D"
                maximumLength:25

                background: Rectangle
                {
                    anchors.fill:parent
                    color:"#142424"
                    radius:4
                }
            }
        Text
        {
            id:emailText
            text:"E-mail"
            color:"white"
            font.pixelSize: 14
            font.bold: false
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: personField.bottom
            anchors.topMargin:10
        }
        TextField
            {
                id:emailField
                height:40
                width:250
                color:"#8C9A9D"

                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: emailText.bottom
                anchors.topMargin: 10
                placeholderText: "E-mail"
                placeholderTextColor: "#8C9A9D"
                maximumLength:40

                background: Rectangle
                {
                    anchors.fill:parent
                    color:"#142424"
                    radius:4
                }
            }

            }


         //========================= KONTAKT ========================================
}
}
