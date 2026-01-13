import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 720
    height: 1280
    visible: true
    title: qsTr("Hello World")

    Rectangle
    {
        id:background
        color: "#344e41"
        height: parent.height
        width: parent.width

        TextField
        {
            id:searchField
            height:60
            width:parent.width-200
            color:"gray"
            placeholderText: "Wyszukaj nazwę"
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top:parent.top
            anchors.topMargin: 40
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle
        {
            id:notifications
            height:60
            width:60
            color: "#a7c957"
            anchors.left: searchField.right
            anchors.top: parent.top
            anchors.leftMargin: 65
            anchors.topMargin: 40
        }

        Rectangle
        {
            id:categories
            height:400
            width:background.width
            color:"#6a994e"
            anchors.left: background.left
            anchors.top: searchField.bottom
            anchors.topMargin: 180
        }

        Rectangle
        {
            id:bottomButtons
            color:"gray"
            height:60
            width:parent.width
            anchors.bottom: parent.bottom

            Button
            {
                id:homeButton
                height:parent.height
                width:parent.width/4
                Rectangle
                {
                    id:homeButtonRect
                    height: parent.height
                    width:parent.width
                    radius:10
                    color:"red"
                }
            }

            Button
            {
                id:favoriteButton
                height:parent.height
                width:parent.width/4
                anchors.left: homeButton.right
                background: Rectangle
                {
                    id:favoriteButtonRect
                    height: parent.height
                    width:parent.width
                    radius:10
                    color:"blue"
                }
            }
            Button
            {
                id:addButton
                height:parent.height
                width:parent.width/10
                anchors.left: favoriteButton.right
                background: Rectangle
                {
                    id:addButtonRect
                    height: parent.height
                    width:parent.width
                    radius:width/2
                    color:"yellow"
                }
            }
        }
    }
}
