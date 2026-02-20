import QtQuick
import QtQuick.Controls 2.15

Item {
Rectangle
{
    id:background
    anchors.fill: parent
    color:"#0d1919"
}

Text
{
    id:loginText
    text:"Zaloguj się/zarejestruj"
    anchors.horizontalCenter: parent.horizontalCenter
    font.pixelSize: 12
    font.bold: true
    color:"white"
    anchors.top: parent.top
    anchors.topMargin: 40
}
Button
{
    id:loginButton
    height:50
    width:parent.width-100
    anchors.top: loginText.bottom
    anchors.topMargin:20
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle
    {
        id:loginRectButton
        anchors.fill: parent
        color:"white"
        radius:5
        Text
        {
        text:"Zaloguj się"
        anchors.centerIn: parent
        font.pointSize: 20
        font.bold: true
        color:"black"

        }
    }

}
Button
{
    id:registerButton
    height:50
    width:parent.width-50
    anchors.top: loginButton.bottom
    anchors.topMargin:20
    anchors.horizontalCenter: parent.horizontalCenter
    Rectangle
    {
        id:registerRectButton
        anchors.fill: parent
        color: mAreaRegister.pressed ? "#d0d0d0" : (mAreaRegister.containsMouse ? "#f2f2f2" : "white")
        radius:5
        Text
        {
        text:"Zarejestruj się"
        anchors.centerIn: parent
        font.pointSize: 20
        font.bold: true
        color:"black"

        }

        MouseArea
        {
            id:mAreaRegister
            anchors.fill: registerRectButton
            cursorShape: Qt.PointingHandCursor
            hoverEnabled:true
            onClicked:
            {

            }
        }

    }
}
}
